import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/view/Pages/homepage.dart';
import 'package:expense_tracker/view/loginpages/splashscreen.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:expense_tracker/viewmodel/providers/expenceprovider.dart';
import 'package:expense_tracker/viewmodel/providers/homepageprovider.dart';
import 'package:expense_tracker/viewmodel/providers/incomeprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
  runApp(const ExpenceTracker());
}

class ExpenceTracker extends StatelessWidget {
  const ExpenceTracker({super.key});
  @override
  Widget build(BuildContext context) {
    MainBoard mainBoard = MainBoard();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IncomeProvider()),
        ChangeNotifierProvider(create: (context) => ExpenceProvider()),
        ChangeNotifierProvider(create: (context) => Homepageprovider()),
        // ChangeNotifierProvider(create: (context) => Authprovider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expence Tracker',
        home:StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(), 
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return HomePage(mainBoard: mainBoard);
            }else{
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}



