import 'package:facebook_clone/login_page.dart';
import 'package:facebook_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    checkUserLoggedIn();
     _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 3),(){});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child:Image.asset('assets/images/logo1.png',
          width: 200,
                  height: 200,
                ),
              ),
              Container(
                child: Text('Facebook',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue
                ),),
              ),
              CircularProgressIndicator(
                value: null,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 6.0,
                semanticsLabel: 'Loading...',
              ),
        SizedBox(height: 16.0),
        //Text(
         // 'Loading...',
         // style: TextStyle(fontSize: 16.0),
         //     )
            ],
          ),
        ),

      ),
    );
  }
  Future<void> checkUserLoggedIn() async{
    final _sharedPref = await SharedPreferences.getInstance();
    //_sharedPref.setBool(SAVE_KEY_NAME, true)
    final _userLoggedIn =_sharedPref.getBool(SAVE_KEY_NAME);

    if(_userLoggedIn== null||_userLoggedIn== false)
      {
        _navigatetohome();
      }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }
}
