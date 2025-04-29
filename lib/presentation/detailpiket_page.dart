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

      // body
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas: Tanggal dan email
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 101, 137, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 50, 88, 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    email,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),            
          ],
        ),
      ),
    );
  }
}