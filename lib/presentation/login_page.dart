import 'package:flutter/material.dart';
import 'package:ucp1flutter/presentation/home_page.dart';
import 'package:ucp1flutter/presentation/register_page.dart';

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
          padding:const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),                
                Center(
                  child: 
                  Image.asset(
                    'assets/images/lg.png',
                      width: 100,
                      height: 100,                   
                  ),
                ),
             
              const SizedBox(height: 40),
                const Text(
                  'SELAMAT DATANG KEMBALI',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              
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
              const SizedBox(height: 20),
              const Text('Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password',
                border: const OutlineInputBorder() 
                ),            
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
               ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                child: Text('Masuk'),
              ),
               TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Belum memiliki akun? Daftar disini!'),
                ),
             
              
            ],
          ),

          )
          
           )
          ),

    );
  }
}