import 'package:flutter/material.dart';
import 'package:praktikumx3/halamanutama.dart';
import 'package:praktikumx3/tampilboidata.dart';

class inputbiodata extends StatelessWidget {
  const inputbiodata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const lamanbiodata(),
    );
  }
}

class lamanbiodata extends StatefulWidget {
  const lamanbiodata({super.key});

  @override
  State<lamanbiodata> createState() => _lamanbiodataState();
}

class _lamanbiodataState extends State<lamanbiodata> {
  TextEditingController nama = TextEditingController();
  TextEditingController nim = TextEditingController();
  TextEditingController alamat = TextEditingController();

  int? _radioSelected;
  String? _radioval;

  var items = ["Islam", "Kristen", "Hindu", "Budha"];
  String setSelecteditem = "Islam";

  Map<String, bool> hoby = {
    'Menggambar': false,
    'Coding': false,
    'Membaca': false,
  };

  List tmpArray = [];

  void getCheckboxItems() {
    tmpArray.clear();
    hoby.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Input Biodata'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Halamanutama()),
              );
            },
            icon: const Icon(Icons.close_sharp),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: nim,
                decoration: InputDecoration(
                  labelText: 'NIM:',
                  icon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  labelText: "Nama",
                  icon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: alamat,
                decoration: InputDecoration(
                  labelText: 'Alamat :',
                  icon: const Icon(Icons.perm_identity),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text("Jenis Kelamin: "),
                  Radio(
                    value: 1,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                        _radioval = "Laki-Laki";
                      });
                    },
                  ),
                  const Text("Laki-Laki"),
                  Radio(
                    value: 2,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                        _radioval = "Perempuan";
                      });
                    },
                  ),
                  const Text("Perempuan"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text('Agama'),
                  const SizedBox(width: 25),
                  DropdownButton<String>(
                    value: setSelecteditem,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        setSelecteditem = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Pilih Hoby"),
              Column(
                children: hoby.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: hoby[key],
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(() {
                        hoby[key] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    getCheckboxItems();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => tampilbiodata(
                          name: nama.text,
                          nim: nim.text,
                          status: null.toString(),
                          jk: _radioval.toString(),
                          hobi: tmpArray,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Kirim Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
