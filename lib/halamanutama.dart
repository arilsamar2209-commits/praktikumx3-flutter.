import 'dart:io';

import 'package:flutter/material.dart';
import 'package:praktikumx3/biodata.dart';
import 'package:praktikumx3/inputpesanan.dart';
import 'package:praktikumx3/tampilboidata.dart';
import 'package:praktikumx3/inputkursus.dart';
import 'package:praktikumx3/tampilkursus.dart';
import 'package:praktikumx3/tampilpesanan.dart';

class Halamanutama extends StatefulWidget {
  const Halamanutama({super.key});

  @override
  State<Halamanutama> createState() => _HalamanutamaState();
}

class _HalamanutamaState extends State<Halamanutama> {
  @override
  Widget build(BuildContext context) {
    String nama = "";
    String jk = "";
    String nim = "";
    String status = "";

    String nomor = "";
    String notel = "";
    String bayar = "";
    List<dynamic> pesanan = [];

    var hobi = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Menu Drawer'),
      ),

      backgroundColor: Colors.white,

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/images/centang.jpeg'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                height: 300,
              ),

              const SizedBox(height: 10),

              const Text('Selamat Datang Pada Aplikasi Biodata'),

              const SizedBox(height: 10),

              const Text(
                'Input Biodata digunakan untuk menginput NIM, Nama, '
                'Alamat, Jenis Kelamin, Agama dan Hobi',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                'Tampil Biodata digunakan untuk menampilkan data NIM, '
                'Nama, Alamat, Jenis Kelamin, Agama dan Hobi',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/rill.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/avatar.jpeg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Input Biodata'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const inputbiodata(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Input Kursus'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const inputkursus(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Input pesanan'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Inputpesanan(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Tampil Kursus'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tampilkursus(
                        noPesan: "",
                        nama: "",
                        noHp: "",
                        jk: "",
                        bahasaInggris: false,
                        python: false,
                        mobileFlutter: false,
                        web: false,
                        total: 0,
                        totalBayar: 0,
                        diskon: 0,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),

            // =========================
            // TAMPIL BIODATA
            // =========================
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Tampil Biodata'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tampilbiodata(
                        name: nama,
                        nim: nim,
                        jk: jk,
                        hobi: hobi,
                        status: status,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Tampil Kursus'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tampilkursus(
                        noPesan: "",
                        nama: "",
                        noHp: "",
                        jk: "",
                        bahasaInggris: false,
                        python: false,
                        mobileFlutter: false,
                        web: false,
                        total: 0,
                        totalBayar: 0,
                        diskon: 0,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Tampil pesanan'),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tampilpesanan(
                        nomor: nomor,
                        nama: nama,
                        notel: notel,
                        bayar: bayar,
                        parkir: 'Jalan kaki',
                        biayaParkir: 0,
                        pesanan: pesanan,
                        kartu: "",
                        ppn: 0,
                        total: 0,
                        totalBayar: 0,
                        diskon: 0,
                        totalSetelahDiskon: 0,
                        totalSetelahPpnDanDiskon: 0,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Keluar'),
              trailing: IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
