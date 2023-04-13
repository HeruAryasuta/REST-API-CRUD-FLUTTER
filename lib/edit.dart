import 'package:flutter/material.dart';
import 'package:mobilee/home.dart';
import 'package:mobilee/repository.dart';

class EditHewan extends StatefulWidget {
  final String idhewan;
  final String namahewan;
  final String jenishewan;
  const EditHewan(
      {super.key,
      required this.idhewan,
      required this.namahewan,
      required this.jenishewan});

  @override
  State<EditHewan> createState() => _EditHewanState();
}

class _EditHewanState extends State<EditHewan> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namaController.text = widget.namahewan;
    _jenisController.text = widget.jenishewan;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Hewan'),
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25, right: 35, left: 35, bottom: 25),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(hintText: 'Nama Hewan'),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Jenis Hewan'),
              controller: _jenisController,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () async {
                  bool response = await repository.putData(
                    widget.idhewan,
                    _namaController.text,
                    _jenisController.text,
                  );

                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  } else {
                    print('Post Data gagal');
                  }
                },
                child: Text('Edit')),
                const SizedBox(height: 15,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () async {
                  bool response = await repository.deleteData(widget.idhewan);

                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  } else {
                    print('Post Data gagal');
                  }
                },
                child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
