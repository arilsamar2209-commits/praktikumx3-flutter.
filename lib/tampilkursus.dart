import 'package:flutter/material.dart';
import 'package:praktikumx3/halamanutama.dart';

class tampilkursus extends StatelessWidget {
  // Data dari halaman input
  final String noPesan;
  final String nama;
  final String noHp;
  final String jk;

  // Pilihan kursus
  final bool bahasaInggris;
  final bool python;
  final bool mobileFlutter;
  final bool web;

  // Total pembayaran
  final int total;

  final dynamic diskon;

  final dynamic totalBayar;

  const tampilkursus({
    super.key,
    required this.noPesan,
    required this.nama,
    required this.noHp,
    required this.jk,

    required this.bahasaInggris,
    required this.python,
    required this.mobileFlutter,
    required this.web,

    required this.total,
    required this.totalBayar,
    required this.diskon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 154, 191),

        title: const Text("Tampil"),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Halamanutama()),
              );
            },

            icon: const Icon(Icons.close),
          ),
        ],
      ),

      // ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // NO PESANAN
            Text("No. Pesanan : $noPesan"),

            const SizedBox(height: 10),

            // NAMA
            Text("Nama : $nama"),

            const SizedBox(height: 10),

            // NO HP
            Text("No. HP : $noHp"),

            const SizedBox(height: 10),

            // STATUS
            Text("Status : $jk"),

            const SizedBox(height: 10),

            // PILIHAN KURSUS
            const Text(
              "Pilihan Kursus :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // BAHASA INGGRIS
            if (bahasaInggris) const Text("- Bahasa Inggris"),

            // PYTHON
            if (python) const Text("- Python"),

            // MOBILE FLUTTER
            if (mobileFlutter) const Text("- Mobile Flutter"),

            // WEB
            if (web) const Text("- Web"),

            const SizedBox(height: 20),
            Text(
              "Total : Rp$total,",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Diskon : Rp$diskon,",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // TOTAL BAYAR
            Text(
              "Total Bayar : Rp$totalBayar,",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
