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

  bool _obscureText = true;

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

                const SizedBox(height: 40),                
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              
              const SizedBox(height: 8),              
              TextFormField(                
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.brown),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18),
                  ),           
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
            
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 8),              
              TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',                  
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.brown),
                  suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // <<< ini untuk toggle show/hide password
                    });
                  },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)
                  ),                 
                ),            
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 50, 88, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(
                      context, 
                       '/home',
                      arguments: emailController.text,
                    );
                  }
                },
                child: const Text('Masuk',
                style: TextStyle(
                  fontSize: 18,
                  color:  Color.fromARGB(255, 246, 251, 177),
                ),
                ),
              ),              
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum memiliki akun? Silahkan ', style: TextStyle(fontSize: 14),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                    },
                    child:const Text('Daftar disini!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 171, 156, 1),
                    ),),
                  )
                ],
              ),        
              
            ],
          ),

          )
          
           )
          ),

    );
  }
}