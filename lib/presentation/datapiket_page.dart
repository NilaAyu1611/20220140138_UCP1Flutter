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
  
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _namaAnggotaController = TextEditingController(text: widget.email);
    _tugasController = TextEditingController();
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
            ],
          ),
        ),
        ),      
    );
  }
}