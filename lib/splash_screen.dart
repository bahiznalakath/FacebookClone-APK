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
    // _navigatetohome();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:Image.network(
                  'https://th.bing.com/th/id/OIP.YBdpYxDSg6AtMUKXHme2MQHaHa?pid=ImgDet&rs=1',
                  // Replace with your desired image link from Google
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
