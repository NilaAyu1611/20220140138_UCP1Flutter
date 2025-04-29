import 'package:flutter/material.dart';

class DatapiketPage extends StatefulWidget {
  final String email;

  const DatapiketPage({Key? key, required this.email}) : super(key: key);

  @override
  State<DatapiketPage> createState() => _DatapiketPageState();
}

class _DatapiketPageState extends State<DatapiketPage> {
  late TextEditingController _namaAnggotaController;
  late TextEditingController _tugasController;
  DateTime? _selectedDate;
  final List<Map<String, dynamic>> _listTugas = [];
  
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _namaAnggotaController = TextEditingController(text: widget.email);
    _tugasController = TextEditingController();
  }

  @override
  void dispose() {
    _namaAnggotaController.dispose();
    _tugasController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _tambahTugas() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _listTugas.add({
          'tanggal': _selectedDate,
          'tugas': _tugasController.text,
        });
        _tugasController.clear();
        _selectedDate = null;
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
        centerTitle: true,
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Anggota'),
              const SizedBox(height: 8),
              TextField(
                controller: _namaAnggotaController,
                readOnly: true,
                decoration: _inputDecoration(),
              ),
              
              //form input pilih tanggal
              const SizedBox(height: 20),
              const Text('Pilih Tanggal'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: _inputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      hintText: _selectedDate == null
                          ? 'Pilih Tanggal'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                    validator: (value) {
                      if (_selectedDate == null) {
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
               const SizedBox(height: 20),

               // form input tugas piket
              const Text('Tugas Piket'),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: _inputDecoration(hintText: 'Tugas Piket'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 230,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: _tambahTugas,
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 246, 251, 177),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              //
              const Center(
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _listTugas.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada Data',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  : ListView.builder(       //list dari semua daftar tugas yang sudah ditambahkan
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _listTugas.length,
                      itemBuilder: (context, index) {
                        final tugas = _listTugas[index];
                        return Card(
                          color: const Color.fromARGB(255, 50, 88, 2),
                          child: ListTile(
                            title: Text(
                              tugas['tugas'],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 212, 240, 177),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color.fromARGB(255, 12, 205, 73),
                            ),
                            onTap: () {                            
                            },
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
        ),      
    );
  }

  // untuk menstyale form field
  InputDecoration _inputDecoration({Widget? prefixIcon, String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}