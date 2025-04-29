import 'package:flutter/material.dart';

class DetailpelangganPage extends StatelessWidget {
    final String namacust;
    final String emailcust;
    final String noHp;


  const DetailpelangganPage({
    super.key,
    required this.namacust,
     required this.emailcust,
    required this.noHp,   

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
      

        // body list detail data yang sudah disimpan
        body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          const SizedBox(height: 12),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/cust.jpg'),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  namacust,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(emailcust),
                const SizedBox(height: 4),
                Text(noHp),
              ],
            ),
          ),          
        ],
      ),    
    );
  }
}