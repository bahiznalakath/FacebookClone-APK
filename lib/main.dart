import 'package:facebook_clone/login_page.dart';
import 'package:facebook_clone/sign_up.dart';
import 'package:facebook_clone/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const SAVE_KEY_NAME ='UserLoggedIn';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     routes:{

       '/':(context)=> SplashScreen(),
      '/home':(context)=> HomePage(),
     '/login':(context)=> LoginPage(),
       '/sign':(context)=> SignUpPage(),



    } ,

      debugShowCheckedModeBanner: false,
    );
  }
}

