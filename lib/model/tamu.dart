// ignore: unused_import
import 'dart:convert';

class Tamu {
  int id;
  String nama;
  String jam;
  String alamat;

  Tamu(
      {required this.id,
      required this.nama,
      required this.jam,
      required this.alamat});

  factory Tamu.fromobj(Map<String, dynamic> obj) {
    return Tamu(
        id: obj['id'],
        nama: obj['nama'],
        jam: obj['jam'],
        alamat: obj['alamat']);
  }
}
