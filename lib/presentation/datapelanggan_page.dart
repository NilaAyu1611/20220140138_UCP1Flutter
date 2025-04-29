import 'package:flutter/material.dart';

class DatapelangganPage extends StatefulWidget {
  const DatapelangganPage({super.key});

  @override
  State<DatapelangganPage> createState() => _DatapelangganPageState();
}

class _DatapelangganPageState extends State<DatapelangganPage> {
  final _formKey = GlobalKey<FormState>();    // kunci untuk form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
        centerTitle: true,
        title: const Text("Data Pelanggan"),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Input Nama Cust
              _buildLabeledField(
                  "Nama Cust", _namacustController, "Cust tidak boleh kosong"),
              const SizedBox(height: 12),  

              // Email dan No HP dalam satu baris
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledField("Email", _emailcustController,
                        "Email tidak boleh kosong"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledField(
                        "No Hp", _noHpController, "No Hp tidak boleh kosong"),
                  ),
                ],
              ),
               const SizedBox(height: 12),

              // Input Alamat
              _buildLabeledField(
                  "Alamat", _alamatController, "Alamat tidak boleh kosong"),
                                     
            ],
          ),
        ),
      ),  
    );
  }
}