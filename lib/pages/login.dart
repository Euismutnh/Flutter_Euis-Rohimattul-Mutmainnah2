import 'package:flutter/material.dart';

import 'home.dart';
import 'registration.dart';

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _apiCall = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submitForm() {
    var username = _usernameController.text;
    var password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      setState(() {
        _apiCall = true;
      });

      // Contoh simulasi pemanggilan API (gantilah dengan pemanggilan API yang sesungguhnya)
      Future.delayed(const Duration(seconds: 2), () {
        // Setelah selesai pemanggilan API, atur _apiCall kembali ke false
        setState(() {
          _apiCall = false;
        });
        // Simulasi berhasil Sign In
        bool signInSuccess =
            true; // Gantilah dengan logika autentikasi yang sesungguhnya
        if (signInSuccess) {
          // Arahkan ke halaman HomePage
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          // ignore: dead_code
        } else {
          // Tampilkan pesan kesalahan jika login gagal
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign In Gagal'),
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 233),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username",
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontSize: 12.0),
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordVisibility,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _apiCall ? null : _submitForm,
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Arahkan ke halaman RegistrationPage
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
