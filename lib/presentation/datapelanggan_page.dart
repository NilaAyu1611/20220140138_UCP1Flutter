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

  void _resetForm() {           // Fungsi untuk mengosongkan semua form input
  _namacustController.clear();
  _emailcustController.clear();
  _noHpController.clear();
  _alamatController.clear();
  _provinsiController.clear();
  _kodePosController.clear();
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
              const SizedBox(height: 25),

              // Tombol RESET
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side:
                      const BorderSide(color: Color.fromARGB(255, 53, 97, 3)),
                ),
                onPressed: _resetForm,
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Color.fromARGB(255, 93, 135, 3),
                    fontSize: 16,
                  ),
                ),
              ), 
            ],
          ),
        ),
      ),  
    );
  }

    /// Widget reusable untuk membuat field input dengan label
  Widget _buildLabeledField(
      String label, TextEditingController controller, String errorMsg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 72, 109, 4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 62, 104, 4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 67, 113, 3), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 220, 43, 4)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 220, 43, 4), width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
        ),
      ],
    );
  }

}