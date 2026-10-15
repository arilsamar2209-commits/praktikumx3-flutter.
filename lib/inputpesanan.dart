import 'package:flutter/material.dart';
import 'package:praktikumx3/tampilpesanan.dart';

//import 'package:inten/menuhome.dart';

//import 'package:praktikumx3/tampilpesanan.dart';

class HitungPesanan {
  const HitungPesanan({
    required this.total,
    required this.persenDiskon,
    required this.persenPpn,
    this.biayaParkir = 0,
  });

  final int total;
  final int persenDiskon;
  final int persenPpn;
  final int biayaParkir;

  int get diskon => (total * persenDiskon / 100).round();
  int get totalSetelahDiskon => total - diskon;
  int get ppn => (totalSetelahDiskon * persenPpn / 100).round();
  int get totalSetelahPpnDanDiskon => totalSetelahDiskon + ppn;
  int get totalBayar => totalSetelahPpnDanDiskon + biayaParkir;
}

class Inputpesanan extends StatelessWidget {
  const Inputpesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const lamanpesanan(),
    );
  }
}

class lamanpesanan extends StatefulWidget {
  const lamanpesanan({super.key});

  @override
  State<lamanpesanan> createState() => _lamanpesananState();
}

class _lamanpesananState extends State<lamanpesanan> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nomor = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController notel = TextEditingController();

  String? _radioSelectedstatus; //untuk radio
  String? _radiovalstatus; //untuk radio
  String? _selectedParking;

  var kartu = ["Gold", "Silver", "Platinum"];
  String? setSelecteditem;

  Map<String, bool> daftarpesanan = {
    'jus jeruk': false,
    'alpucad': false,
    'mie rebus': false,
    'gado-gado': false,
  };

  static const Map<String, double> diskonKartuPersen = {
    'Gold': 10,
    'Silver': 5,
    'Platinum': 2.5,
  };

  int get total => daftarpesanan.entries
      .where((pesanan) => pesanan.value)
      .fold(0, (jumlah, pesanan) => jumlah + biaya[pesanan.key]!);

  int get diskon =>
      (total * (diskonKartuPersen[setSelecteditem] ?? 0) / 100).round();

  int get totalSetelahDiskon => total - diskon;

  int get ppn {
    final tarifPpnPersen = switch (_radioSelectedstatus) {
      '1' => 3,
      '2' => 2,
      _ => 0,
    };
    return (totalSetelahDiskon * tarifPpnPersen / 100).round();
  }

  int get totalSetelahPpnDanDiskon => totalSetelahDiskon + ppn;

  int get biayaParkir => switch (_selectedParking) {
    'motor' => 5000,
    'mobil' => 10000,
    _ => 0,
  };

  int get totalBayar => totalSetelahPpnDanDiskon + biayaParkir;

  Map<String, int> biaya = {
    'jus jeruk': 15000,
    'alpucad': 20000,
    'mie rebus': 10000,
    'gado-gado': 17500,
  };
  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Pesanan'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanHome()),
                );
              });
            },
            icon: Icon(Icons.close_sharp),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(20)),
              TextFormField(
                controller: nomor,
                decoration: InputDecoration(
                  labelText: 'No Pesanan :',
                  icon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No pesanan tidak boleh kosong';
                  } else if (int.tryParse(value) == null) {
                    return 'hanya boleh diisi dengan angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  labelText: "nama",
                  icon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: notel,
                decoration: InputDecoration(
                  labelText: 'No Telpon :',
                  icon: const Icon(Icons.perm_identity),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No telpon tidak boleh kosong';
                  } else if (int.tryParse(value) == null) {
                    return 'hanya boleh diisi dengan angka dan dimulai dari 0';
                  } else if (value.length >= 12) {
                    return 'No Telpon harus 12 digit';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text('kartu anggota : '),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    hint: const Text('Choose'),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: setSelecteditem,
                    items: kartu.map((String kartu) {
                      return DropdownMenuItem(value: kartu, child: Text(kartu));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        setSelecteditem = newValue;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      const Text("pembayaran : "),
                      Radio(
                        value: '1',
                        groupValue: _radioSelectedstatus,
                        onChanged: (value) {
                          setState(() {
                            _radioSelectedstatus = value as String;
                            _radiovalstatus = "Tunai";
                          });
                        },
                      ),
                      const Text("Tunai"),
                      Radio(
                        value: '2',
                        groupValue: _radioSelectedstatus,
                        onChanged: (value) {
                          setState(() {
                            _radioSelectedstatus = value as String;
                            _radiovalstatus = "Transfer";
                          });
                        },
                      ),
                      const Text("Transfer"),
                    ],
                  ),
                  if (_radioSelectedstatus == '1')
                    const Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "ppn 3% untuk pembayaran tunai",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),

                  if (_radioSelectedstatus == '2')
                    const Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "ppn 2% untuk pembayaran transfer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Parkir : "),
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'jalan kaki',
                                  groupValue: _selectedParking,
                                  onChanged: (value) {
                                    setState(() => _selectedParking = value);
                                  },
                                ),
                                const Text("Jalan kaki (Rp0)"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'motor',
                                  groupValue: _selectedParking,
                                  onChanged: (value) {
                                    setState(() => _selectedParking = value);
                                  },
                                ),
                                const Text("Motor (Rp5.000)"),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: 'mobil',
                                  groupValue: _selectedParking,
                                  onChanged: (value) {
                                    setState(() => _selectedParking = value);
                                  },
                                ),
                                const Text("Mobil (Rp10.000)"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Pilih pesanan"),

              Column(
                children: daftarpesanan.keys.map((String key) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: Text(key),
                        value: daftarpesanan[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool? value) {
                          setState(() {
                            daftarpesanan[key] = value ?? false;
                          });
                        },
                      ),
                      //muncul harga pesanan jika di centang
                      if (daftarpesanan[key] == true)
                        Text(
                          "Harga: Rp ${biaya[key]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (_radioSelectedstatus == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Pilih metode pembayaran terlebih dahulu',
                          ),
                        ),
                      );
                      return;
                    }

                    final pesananDipilih = daftarpesanan.entries
                        .where((pesanan) => pesanan.value)
                        .map((pesanan) => pesanan.key)
                        .toList();

                    if (pesananDipilih.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pilih minimal satu pesanan'),
                        ),
                      );
                      return;
                    }

                    final pembayaranDipilih =
                        _radiovalstatus ?? 'Belum dipilih';
                    final parkirDipilih = _selectedParking ?? 'Jalan kaki';

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tampilpesanan(
                          nomor: nomor.text,
                          nama: nama.text,
                          notel: notel.text,
                          bayar: pembayaranDipilih,
                          parkir: parkirDipilih,
                          biayaParkir: biayaParkir,
                          kartu: setSelecteditem ?? 'Tidak ada',
                          pesanan: pesananDipilih,
                          total: total,
                          diskon: diskon,
                          totalSetelahDiskon: totalSetelahDiskon,
                          ppn: ppn,
                          totalSetelahPpnDanDiskon: totalSetelahPpnDanDiskon,
                          totalBayar: totalBayar,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Pesan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
