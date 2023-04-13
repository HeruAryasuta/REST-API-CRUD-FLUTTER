import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobilee/model.dart';

class Repository {
  Future<List<Hewan>> getAllData() async {
    final response = await http
        .get(Uri.parse('https://642ef02d2b883abc641adebd.mockapi.io/hewan'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Hewan.fromJson(data)).toList();
    } else {
      throw Exception('Gagal Menampilkan Data');
    }
  }

  Future postData(
    String pnamahewan,
    String jenishewan,
  ) async {
    final response = await http.post(
        Uri.parse('https://642ef02d2b883abc641adebd.mockapi.io/hewan'),
        body: {
          "namahewan": pnamahewan,
          "jenishewan": jenishewan,
        });
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Gagal Menambah Data');
    }
  }

  Future<Hewan> getSingleData(String id) async {
    final response = await http.get(
        Uri.parse('https://642ef02d2b883abc641adebd.mockapi.io/hewan/$id'));
    if (response.statusCode == 200) {
      Hewan jsonResponse = Hewan.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Gagal Manampilkan');
    }
  }

  Future putData(
    String idhewan,
    String pnamahewan,
    String jenishewan,
  ) async {
    final response = await http.put(
        Uri.parse(
            'https://642ef02d2b883abc641adebd.mockapi.io/hewan/' + idhewan),
        body: {
          "namahewan": pnamahewan,
          "jenishewan": jenishewan,
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Menambah Data');
    }
  }

  Future deleteData(
    String idhewan,
  ) async {
    final response = await http.delete(Uri.parse(
        'https://642ef02d2b883abc641adebd.mockapi.io/hewan/' + idhewan));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Menambah Data');
    }
  }
}
