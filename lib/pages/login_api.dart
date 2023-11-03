// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'home.dart';
// import 'registration.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: Login(),
//   ));
// }

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//   bool _apiCall = false;

//   BuildContext? _context;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   Future<void> _submitForm() async {
//     var username = _usernameController.text;
//     var password = _passwordController.text;

//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _apiCall = true;
//       });

//       var url = Uri.parse(
//           'https://example.com/api/signin'); 

//       var response = await http.post(
//         url,
//         body: {
//           'username': username,
//           'password': password,
//         },
//       );

//       if (response.statusCode == 200) {
//         Navigator.push(_context!,
//             MaterialPageRoute(builder: (context) => const HomePage()));
//       } else {
//         ScaffoldMessenger.of(_context!).showSnackBar(
//           const SnackBar(
//             content: Text('Sign In Gagal'),
//           ),
//         );
//       }

//       setState(() {
//         _apiCall = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _context = context; // Simpan context ke _context

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 246, 246, 233),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/logo.png',
//                 width: 180,
//                 height: 270,
//               ),
//               const SizedBox(height: 1),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "Username",
//                         hintStyle:
//                             TextStyle(color: Colors.black, fontSize: 12.0),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Username is required';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                         border: const OutlineInputBorder(),
//                         hintText: "Password",
//                         hintStyle: const TextStyle(
//                             color: Colors.black, fontSize: 12.0),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             _togglePasswordVisibility();
//                           },
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Password is required';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 15),
//                     GestureDetector(
//                       onTap: _apiCall
//                           ? null
//                           : () {
//                               _submitForm();
//                             },
//                       child: Container(
//                         width: 120,
//                         height: 40,
//                         margin: const EdgeInsets.symmetric(horizontal: 50),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color.fromARGB(255, 23, 103, 26),
//                         ),
//                         child: Center(
//                           child: _apiCall
//                               ? const CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                       Colors.white),
//                                 )
//                               : const Text(
//                                   'Sign In',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const RegistrationPage()));
//                       },
//                       child: Container(
//                         width: 120,
//                         height: 40,
//                         margin: const EdgeInsets.symmetric(horizontal: 50),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color.fromARGB(255, 23, 103, 26),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
