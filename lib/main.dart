import 'package:flutter/material.dart';
import 'package:praktikumx3/halamanutama.dart';

void main() {
  runApp(const intentprak());
}

class intentprak extends StatelessWidget {
  const intentprak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: prakhalinten(),
    );
  }
}

class prakhalinten extends StatefulWidget {
  const prakhalinten({super.key});

  @override
  State<prakhalinten> createState() => _prakhalintenstate();
}

class _prakhalintenstate extends State<prakhalinten> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Halamanutama()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('lib/assets/images/buku.jpeg', height: 240)],
        ),
      ),
    );
  }
}
