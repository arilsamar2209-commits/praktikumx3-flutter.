import 'package:flutter_test/flutter_test.dart';
import 'package:praktikumx3/inputpesanan.dart';

void main() {
  test('menghitung seluruh alur diskon dan PPN', () {
    const hitung = HitungPesanan(total: 100000, persenDiskon: 10, persenPpn: 3);

    expect(hitung.diskon, 10000);
    expect(hitung.totalSetelahDiskon, 90000);
    expect(hitung.ppn, 2700);
    expect(hitung.totalSetelahPpnDanDiskon, 92700);
  });

  test('total akhir tetap menambahkan biaya parkir', () {
    const hitung = HitungPesanan(
      total: 100000,
      persenDiskon: 10,
      persenPpn: 3,
      biayaParkir: 5000,
    );

    expect(hitung.totalBayar, 97700);
  });
}
