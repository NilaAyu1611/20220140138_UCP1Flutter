import 'package:flutter/material.dart';

class DatabarangPage extends StatefulWidget {
  const DatabarangPage({super.key});

  @override
  State<DatabarangPage> createState() => _DatabarangPageState();
}

class _DatabarangPageState extends State<DatabarangPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F3),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
        title: const Text('Pendataan Barang'),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}