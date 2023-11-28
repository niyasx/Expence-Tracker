


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class FirebaseServices{
final _auth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();
EmailOTP myotp=EmailOTP();


  signinWithGoogle()async{
    try {
      final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn();
      if (googleSignInAccount !=null) {
        final GoogleSignInAuthentication googleSignInAuthentication= 
        await googleSignInAccount.authentication;
        final AuthCredential authCredential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
      }
    }on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
      
    }
  }

  googleSignOut()async{
    _auth.signOut();
    _googleSignIn.signOut();
  }

 sendotp()async{
 
 }
}

class EmailOTP {
  
    EmailOTP();
  
  Future<String> sendOtp(email) async {
    Uri requestUrl = Uri.parse('https://malluscart.online/flutter-projects/expense-app/mail-verification/mailer.php?email=$email');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
    return responseJson["id"];
  }
    Future<String> verifyOtp(id,userOtp) async {
    Uri requestUrl = Uri.parse('https://malluscart.online/flutter-projects/expense-app/mail-verification/verify-otp.php?id=$id&otp=$userOtp');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
    return responseJson["status"];
  }
}

class DateBaseServices{

  Future<String?> addUser({
    required String fullName,
    required String email,
    // required String uid
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      // Call the user's CollectionReference to add a new user
      await users.doc(email).set({
        'full_name': fullName,
        'email':email,
        // 'uid':uid
      });
      return 'success';
    } catch (e) {
      return 'Error adding user';
    }
  }

  Future<String?> getUser(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }
}

 

class PhoneAuth{
  
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumberrr( String phoneNumber ,
  String verificationId ) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatically handle verification if the phone number can be verified without user intervention.
        // For example, in case of re-installing the app on the same device.
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification Failed: ${e.message}');
      },
      codeSent: (String verificationId2, int? resendToken) {
       verificationId2 = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId3) {
        verificationId3 = verificationId;
      },
    );
  }

  Future<void> signInWithPhoneNumber(String smsCode,String verificationId4) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId4,
      smsCode: smsCode,
    );
    try {
      await auth.signInWithCredential(credential);
      print('Successfully signed in');
    } catch (e) {
      print('Error signing in: $e');
    }
  }
  
}