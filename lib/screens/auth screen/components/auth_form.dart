// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:make_links/screens/chat%20screen/chat_screen.dart';

// class AuthForm extends StatefulWidget {
//   const AuthForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _AuthFormState createState() => _AuthFormState();
// }

// class _AuthFormState extends State<AuthForm> {
//   final _formKey = GlobalKey<FormState>();

//   var _isLogin = true;
//   String? _email = '';
//   String? _username = '';
//   String? _password = '';

//   final _auth = FirebaseAuth.instance;

//   void _submitAuthForm(
//       {String? email,
//       String? username,
//       String? password,
//       bool? isLogin}) async {
//     UserCredential authResult;
//     try {
//       if (isLogin!) {
//         authResult = await _auth.signInWithEmailAndPassword(
//             email: email!, password: password!);
//         Get.to(() => const ChatScreen());
//       } else {
//         authResult = await _auth.createUserWithEmailAndPassword(
//             email: email!, password: password!);
//         FirebaseFirestore.instance
//             .collection('user')
//             .doc(authResult.user!.uid)
//             .set({'email': email, 'username': username, 'password': password});
//         Get.to(() => const ChatScreen());
//       }
//     } catch (err) {
//       Get.snackbar('Error', '$err');
//     }
//   }

//   void _trySubmit() {
//     final _isValid = _formKey.currentState!.validate();
//     FocusScope.of(context).unfocus();
//     if (_isValid) {
//       _formKey.currentState!.save();
//       _submitAuthForm(
//           email: _email,
//           password: _password,
//           isLogin: _isLogin,
//           username: _username);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextFormField(
//                     key: const ValueKey('email'),
//                     validator: (value) {
//                       if (value!.isEmpty || !value.contains('@')) {
//                         return "Please enter valid email address.";
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       labelText: 'Email Address',
//                     ),
//                     onSaved: (value) {
//                       _email = value;
//                     },
//                   ),
//                   if (!_isLogin)
//                     TextFormField(
//                       key: const ValueKey('username'),
//                       decoration: const InputDecoration(
//                         labelText: 'Username',
//                       ),
//                       onSaved: (value) {
//                         _username = value;
//                       },
//                     ),
//                   TextFormField(
//                     key: const ValueKey('password'),
//                     validator: (value) {
//                       if (value!.isEmpty || value.length < 6) {
//                         return "Password must be at least 6 character long.";
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                     ),
//                     obscureText: true,
//                     onSaved: (value) {
//                       _password = value;
//                     },
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                           onPressed: _trySubmit,
//                           child: Text(_isLogin ? 'Login' : 'Sign up')),
//                       TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _isLogin = !_isLogin;
//                             });
//                           },
//                           child: Text(_isLogin
//                               ? 'Create new account'
//                               : 'Already have an account'),),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
