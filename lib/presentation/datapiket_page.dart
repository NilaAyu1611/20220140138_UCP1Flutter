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
            ],
          ),
        ),
        ),      
    );
  }
}