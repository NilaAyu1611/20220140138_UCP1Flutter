import 'package:flutter/material.dart';

class DetailpelangganPage extends StatelessWidget {
    final String namacust;


  const DetailpelangganPage({
    super.key,
    required this.namacust,
  });

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F7),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 88, 2),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Detail $namacust"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}