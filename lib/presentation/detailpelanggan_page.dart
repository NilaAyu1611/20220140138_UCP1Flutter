import 'package:flutter/material.dart';
import 'package:ucp1flutter/presentation/home_page.dart';

class DetailpelangganPage extends StatelessWidget {
    final String namacust;
    final String emailcust;
    final String noHp;
    final String alamat;
    final String provinsi;
    final String kodePos;
    final String email;



  const DetailpelangganPage({
    super.key,
    required this.namacust,
    required this.emailcust,
    required this.noHp,   
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
     required this.email,

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
          const SizedBox(height: 24),

          const Text("Alamat", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildReadOnlyField(alamat),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Provinsi",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    _buildReadOnlyField(provinsi),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kode Pos",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    _buildReadOnlyField(kodePos),
                  ],
                ),
              ),
            ],
          ),  
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage(email: email)),
                (route) => false,
              );
            },
            child: const Text("Selesai", style: TextStyle(fontSize: 16)),
          ),                  
        ],
      ),    
    );
  }
    Widget _buildReadOnlyField(String value) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}