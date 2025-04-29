import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatabarangPage extends StatefulWidget {
  const DatabarangPage({super.key});

  @override
  State<DatabarangPage> createState() => _DatabarangPageState();
}

class _DatabarangPageState extends State<DatabarangPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  String? _selectedJenisTransaksi;

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

  String _formatTanggal(DateTime date) {
    final formatter = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
    return formatter.format(date);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F3),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 88, 2),
        title: const Text('Pendataan Barang'),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: _inputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      hintText: _selectedDate == null
                          ? 'Tanggal Transaksi'
                          : _formatTanggal(_selectedDate!),
                    ),
                    validator: (_) =>
                        _selectedDate == null ? 'Tanggal tidak boleh kosong' : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),              
            ],
          ),
        ),
      ),
    );
  }
}