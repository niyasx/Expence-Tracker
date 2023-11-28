// import 'package:expense_tracker/loginpages/otpscreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Authprovider extends ChangeNotifier {
//   bool _isSignedin = false;

//   bool get isSignedIn => _isSignedin;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Authprovider() {
//     checkSign();
//   }

//   checkSign() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     _isSignedin = sharedPreferences.getBool("is_signedin") ?? false;
//     notifyListeners();
//   }

//   void signInWithPhone(BuildContext context, String phonenumber) async {
//     try {
//       await _firebaseAuth.verifyPhoneNumber(
//         phoneNumber: phonenumber,
//           verificationCompleted:
//               (PhoneAuthCredential phoneAuthCredential) async {
//             await _firebaseAuth.signInWithCredential(phoneAuthCredential);
//           },
//           verificationFailed: (error) {
//             throw Exception(error);
//           },
//           codeSent: ((verificationId, forceResendingToken) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         OtpScreen(verificationID: verificationId)));
//           }),
//           codeAutoRetrievalTimeout: ((verificationId) {}));
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
//     }
//   }
// }
