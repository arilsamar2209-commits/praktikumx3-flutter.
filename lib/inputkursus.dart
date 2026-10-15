import 'package:flutter/material.dart';
import 'package:praktikumx3/halamanutama.dart';
import 'package:praktikumx3/tampilkursus.dart';

class inputkursus extends StatelessWidget {
  const inputkursus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const lamaninputkursus(),
    );
  }
}

class lamaninputkursus extends StatefulWidget {
  const lamaninputkursus({super.key});

  @override
  State<lamaninputkursus> createState() => _lamaninputkursusState();
}

class _lamaninputkursusState extends State<lamaninputkursus> {
  // Controller
  TextEditingController noPesan = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController noHp = TextEditingController();

  // Status
  int? status;
  String? st;

  // Pilihan kursus
  bool bahasaInggris = false;
  bool python = false;
  bool mobileFlutter = false;
  bool web = false;

  // Perhitungan
  int total = 0;
  int diskon = 0;
  int totalBayar = 0;

  // =========================
  // HITUNG TOTAL
  // =========================
  void hitungTotal() {
    total = 0;

    if (bahasaInggris) {
      total += 150000;
    }

    if (python) {
      total += 175000;
    }

    if (mobileFlutter) {
      total += 200000;
    }

    if (web) {
      total += 225000;
    }

    if (st == "Mahasiswa") {
      diskon = (total * 5 / 100).round();
    } else {
      diskon = 0;
    }

    totalBayar = total - diskon;
  }

  // =========================
  // FORMAT RUPIAH
  // =========================
  String rupiah(int angka) {
    return "Rp${angka.toString()}";
  }

  // =========================
  // RESET
  // =========================
  void resetData() {
    setState(() {
      noPesan.clear();
      nama.clear();
      noHp.clear();

      status = null;
      st = null;

      bahasaInggris = false;
      python = false;
      mobileFlutter = false;
      web = false;

      total = 0;
      diskon = 0;
      totalBayar = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Input Kursus"),
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // =========================
            // NO PESANAN
            // =========================
            TextField(
              controller: noPesan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "No. Pesanan",
                prefixIcon: const Icon(Icons.confirmation_number),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // NAMA
            // =========================
            TextField(
              controller: nama,
              decoration: InputDecoration(
                labelText: "Nama",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // =========================
            // NO HP
            // =========================
            TextField(
              controller: noHp,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "No. Telp",
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // STATUS
            // =========================
            const Text(
              "Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                      st = "Mahasiswa";
                    });
                  },
                ),
                const Text("Mahasiswa"),

                Radio<int>(
                  value: 2,
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                      st = "Umum";
                    });
                  },
                ),
                const Text("Umum"),
              ],
            ),

            const SizedBox(height: 10),

            // =========================
            // PILIHAN KURSUS
            // =========================
            const Text(
              "Pilihan Kursus",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            CheckboxListTile(
              title: const Text("Bahasa Inggris"),
              subtitle: const Text("Rp150.000"),
              value: bahasaInggris,
              onChanged: (value) {
                setState(() {
                  bahasaInggris = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Python"),
              subtitle: const Text("Rp175.000"),
              value: python,
              onChanged: (value) {
                setState(() {
                  python = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Mobile Flutter"),
              subtitle: const Text("Rp200.000"),
              value: mobileFlutter,
              onChanged: (value) {
                setState(() {
                  mobileFlutter = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Web"),
              subtitle: const Text("Rp225.000"),
              value: web,
              onChanged: (value) {
                setState(() {
                  web = value ?? false;
                });
              },
            ),

            const SizedBox(height: 20),

            // =========================
            // TAMPILKAN TOTAL
            // =========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hitungTotal();
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tampilkursus(
                      noPesan: noPesan.text,
                      nama: nama.text,
                      noHp: noHp.text,
                      jk: st ?? "",
                      bahasaInggris: bahasaInggris,
                      python: python,
                      mobileFlutter: mobileFlutter,
                      web: web,
                      total: total,
                      diskon: diskon,
                      totalBayar: totalBayar,
                    ),
                  ),
                );
              },
              child: const Text("Tampil"),
            ),

            const SizedBox(height: 10),

            // =========================
            // RESET
            // =========================
            ElevatedButton(onPressed: resetData, child: const Text("Reset")),

            const SizedBox(height: 20),

            // =========================
            // INFORMASI DISKON
            // =========================
            if (st == "Mahasiswa")
              Text(
                "mahasiswa mendapatkan diskon 5%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
