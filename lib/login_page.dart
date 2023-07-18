import 'package:facebook_clone/home_page.dart';
import 'package:facebook_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: widget._formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "value is empty";
                  } else {
                    return null;
                  }
                },
                controller: widget._usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Set the border radius
                  ),
                  hintText: 'Username',
                  labelText: 'Username', // Changed from 'label' to 'labelText'
                  icon: Icon(Icons.mail),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  //    if(widget._isDataMatched){
                  //    return null;
                  //}else{
                  //return 'Error';
                  //}
                  if (value == null || value.isEmpty) {
                    return "value is empty";
                  } else {
                    return null;
                  }
                },
                controller: widget._passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Set the border radius
                  ),
                  labelText: 'Password', // Changed from 'label' to 'labelText'
                  hintText: 'Password',
                  icon: Icon(Icons.password),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: !widget._isDataMatched,
                      child: Text(
                        'Username password doesnot match',
                        style: TextStyle(color: Colors.red),
                      )),
                  ElevatedButton(
                    onPressed: () {
                     if(widget._formkey.currentState!.validate()){
                       checkLogin(context);
                     }else{
                       print("Data empty");
                     }
                      //
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async{
    final _username = widget._usernameController.text;
    final _password = widget._passwordController.text;

    if (_username == _password) {
      print("Username password match");
      final _sharedPrefs = await SharedPreferences.getInstance();
      await  _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context1)=> HomePage()));
      // Go to home
    } else {
      print("Username password doesnot  match");
      // Show snackbar
      //ScaffoldMessenger.of(context).showSnackBar(
      //SnackBar(content: Text('Username and password do not match')),);
      setState(() {
        widget._isDataMatched = false;
      });
    }
  }
}
