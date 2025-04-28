import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;     //kita bedakan dng login
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();    //kunci untuk mengkases dan mengontrol Form dr laur widgetnya
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Image.asset(
                  'assets/images/lg.png', // Ganti dengan logo kamu
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'DAFTAR AKUN BARU',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        )),
    );
  }
}