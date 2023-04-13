import 'package:flutter/material.dart';
import 'package:mobilee/home.dart';
import 'package:mobilee/repository.dart';

class AddHewan extends StatefulWidget {
  const AddHewan({super.key});

  @override
  State<AddHewan> createState() => _AddHewanState();
}

class _AddHewanState extends State<AddHewan> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Hewan'),
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
              controller: _jenisController,
              decoration: InputDecoration(hintText: 'Jenis Hewan'),
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
                  bool response = await repository.postData(
                      _namaController.text, _jenisController.text);

                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  } else {
                    print('Post Data gagal');
                  }
                },
                child: Text('Tambah')),
          ],
        ),
      ),
    );
  }
}
