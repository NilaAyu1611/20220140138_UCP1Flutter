import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELAMAT DATANG KEMBALI', style: TextStyle(fontSize: 20),),
              
              const SizedBox(height: 20),
              const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
              TextFormField(                
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder()           
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              
            ],
          ), )),

    );
  }
}