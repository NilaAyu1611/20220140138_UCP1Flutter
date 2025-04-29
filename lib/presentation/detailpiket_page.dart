import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailpiketPage extends StatelessWidget {
  final String tugas;
  final DateTime tanggal;
  final String email;

 const DetailpiketPage({
    Key? key,
    required this.tugas,
    required this.tanggal,
    required this.email,
  }) : super(key: key);

}

class _DetailpiketPageState extends State<DetailpiketPage> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(tanggal);     //format tanggal dalam b.indo

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
        title: Text(
          'Detail $tugas',    //Detail appbar mengiktui nama tugas yang sudah ditambahkan
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        elevation: 0,
      ),

    );
  }
}