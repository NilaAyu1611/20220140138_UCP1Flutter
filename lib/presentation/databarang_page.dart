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
  String? _selectedJenisBarang;

  final List<String> _jenisTransaksiOptions = ['Barang Masuk', 'Barang Keluar'];
  final List<String> _jenisBarangOptions = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];


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

   InputDecoration _inputDecoration({String? hintText, Widget? prefixIcon, String? labelText}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color.fromARGB(255, 50, 88, 2)),
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

              // dropdown jenis barang dan jenis trx
              DropdownButtonFormField<String>(
                decoration: _inputDecoration(labelText: 'Jenis Transaksi'),
                value: _selectedJenisTransaksi,
                items: _jenisTransaksiOptions.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (val) => setState(() {
                  _selectedJenisTransaksi = val;
                }),
                validator: (val) => val == null ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                decoration: _inputDecoration(labelText: 'Jenis Barang'),
                value: _selectedJenisBarang,
                items: _jenisBarangOptions.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (val) => setState(() {
                  _selectedJenisBarang = val;
                }),
                validator: (val) => val == null ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 20),

              //form input jumlah barang dan harga satuan
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jumlah Barang',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _jumlahBarangController,
                          keyboardType: TextInputType.number,
                          decoration: _inputDecoration(hintText: 'Jumlah Barang'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harga Satuan',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _hargaSatuanController,
                          keyboardType: TextInputType.number,
                          decoration: _inputDecoration(
                            hintText: 'Harga Satuan',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 12, right: 8),
                              child: Text(
                                'Rp.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga satuan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              //button submit 
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 50, 88, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  onPressed: _submitForm,
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 220, 244, 160)),
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