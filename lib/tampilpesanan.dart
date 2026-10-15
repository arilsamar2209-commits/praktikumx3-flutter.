import 'package:flutter/material.dart';
import 'package:praktikumx3/tampilpesanan.dart';

class HalamanHome extends StatelessWidget {
  const HalamanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const Center(child: Text('Halaman Home')),
    );
  }
}

class Tampilpesanan extends StatelessWidget {
  final String nomor;
  final String nama;
  final String notel;
  final String bayar;
  final String parkir;
  final int biayaParkir;
  final String kartu;
  final List pesanan;
  final int total;
  final int diskon;
  final int totalSetelahDiskon;
  final int ppn;
  final int totalSetelahPpnDanDiskon;
  final int totalBayar;

  const Tampilpesanan({
    super.key,
    required this.nomor,
    required this.nama,
    required this.notel,
    required this.bayar,
    required this.parkir,
    required this.biayaParkir,
    required this.kartu,
    required this.pesanan,
    required this.total,
    required this.diskon,
    required this.totalSetelahDiskon,
    required this.ppn,
    required this.totalSetelahPpnDanDiskon,
    required this.totalBayar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No Pesanan: $nomor'),
            const SizedBox(height: 8),
            Text('Nama: $nama'),
            const SizedBox(height: 8),
            Text('No Telp: $notel'),
            const SizedBox(height: 8),
            Text('Pembayaran: $bayar'),
            Text('Parkir: $parkir (Rp $biayaParkir)'),
            const SizedBox(height: 8),
            Text('Kartu anggota: $kartu'),
            Text('Total: Rp $total'),
            Text('Diskon: Rp $diskon'),
            Text('Total setelah diskon: Rp $totalSetelahDiskon'),
            Text('PPN: Rp $ppn'),
            Text(
              'Total setelah PPN dan diskon: '
              'Rp $totalSetelahPpnDanDiskon',
            ),
            Text(
              'Total bayar: Rp $totalBayar',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pesanan:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...pesanan.map((item) => Text('- $item')).toList(),
          ],
        ),
      ),
    );
  }
}
