import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perkenalan"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Text("Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun"),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(nama),
              subtitle: const Text('Nama'),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: Text(nim),
              subtitle: const Text('NIM'),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text('$umur tahun'),
              subtitle: const Text('Umur'),
            )
          ],
        ),
      ),
    );
  }
}
