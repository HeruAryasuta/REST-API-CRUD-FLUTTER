import 'package:flutter/material.dart';
import 'package:mobilee/add.dart';
import 'package:mobilee/edit.dart';
import 'package:mobilee/model.dart';
import 'package:mobilee/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repositoryApi = Repository();
  late Future<List<Hewan>> ListHewan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ListHewan = repositoryApi.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<Hewan>>(
                future: ListHewan,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Hewan> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditHewan(
                                  idhewan: isiData[index].id,
                                  namahewan: isiData[index].namahewan,
                                  jenishewan: isiData[index].jenishewan,
                                ),
                              )),
                          child: Card(
                            child: ListTile(
                              title: Text(isiData[index].namahewan),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].gambar),
                              ),
                              subtitle: Text(isiData[index].id),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const AddHewan())),
            child: Text('Tambah Data'),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
