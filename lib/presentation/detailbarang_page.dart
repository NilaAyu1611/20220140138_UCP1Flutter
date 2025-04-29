import 'package:flutter/material.dart';

class DetailbarangPage extends StatefulWidget {
  const DetailbarangPage({super.key});

  @override
  State<DetailbarangPage> createState() => _DetailbarangPageState();
}

class _DetailbarangPageState extends State<DetailbarangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      body: SafeArea(child: Column(
        children: [
            const SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.shade100,
                child: const Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Color.fromARGB(255, 39, 186, 44),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Berhasil Disimpan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
          ],

      )),
    );
  }
}