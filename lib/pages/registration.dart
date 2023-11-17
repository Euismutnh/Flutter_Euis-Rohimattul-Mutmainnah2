import 'package:flutter/material.dart';
import 'home.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _apiCall = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submitForm() {
    var fullName = _fullNameController.text;
    var email = _emailController.text;
    var phone = _phoneController.text;
    var password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      setState(() {
        _apiCall = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        // Setelah selesai pemanggilan API, atur _apiCall kembali ke false
        setState(() {
          _apiCall = false;
        });
        bool signUpSuccess = true;
        if (signUpSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          // ignore: dead_code
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign Up Gagal'),
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
              const SizedBox(height: 30),
              Image.asset(
                'assets/logo.png',
                width: 180,
                height: 270,
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        hintText: "Insert Your Full Name",
                        labelText: "Full Name",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 23, 103, 26),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Full Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        hintText: "Insert Your Email",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 23, 103, 26),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        hintText: "Insert Your Phone Number",
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 23, 103, 26),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 103, 26)),
                        ),
                        hintText: "Insert Password",
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 23, 103, 26),
                        ),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12.0),
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
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: _apiCall ? null : _submitForm,
                      child: Container(
                        width: 120,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 23, 103, 26),
                        ),
                        child: Center(
                          child: _apiCall
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
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
