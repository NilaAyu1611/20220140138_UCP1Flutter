import 'package:flutter/material.dart';

class DatapelangganPage extends StatefulWidget {
  const DatapelangganPage({super.key});

  @override
  State<DatapelangganPage> createState() => _DatapelangganPageState();
}

class _DatapelangganPageState extends State<DatapelangganPage> {
  final _formKey = GlobalKey<FormState>();    // kunci untuk form

  // controller untuk input field
  final _namacustController = TextEditingController();
  final _emailcustController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodePosController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailpelangganPage(
            nama: _namacustController.text,
            email: _emailcustController.text,
            noHp: _noHpController.text,
            alamat: _alamatController.text,
            provinsi: _provinsiController.text,
            kodePos: _kodePosController.text,
          ),
        ),
      );
    }
  }

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
                  const SizedBox(height: 12),

              // Provinsi dan Kode Pos dalam satu baris
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledField("Provinsi", _provinsiController,
                        "Provinsi tidak boleh kosong"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledField("Kode Pos", _kodePosController,
                        "Pos tidak boleh kosong"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Tombol SIMPAN
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 50, 88, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: _submitForm,
                child: const Text(
                  'Simpan',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 246, 251, 177),
                  ),
                ),
              ),             
              
            ],
          ),
        ),
      ),  
    );
  }
}