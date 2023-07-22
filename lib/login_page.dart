import 'package:facebook_clone/google_sign_in.dart';
import 'package:facebook_clone/home_page.dart';
import 'package:facebook_clone/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();
  bool passToggle = false;
  bool isEmailValid =false;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Form(
          key: widget._formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                child:Column(
                  children: [
                    Image.asset('assets/images/logo1.png',
                      width: 200,
                      height: 150,
                    ),
                    Text("Facebook",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),
              TextFormField(
                validator: (value) {
                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                  if (value == null || value.isEmpty) {
                    return 'Value is empty';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }

                  widget.isEmailValid = true;

                  return null;
                },
                controller: widget._emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'enter your mail',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Password is required';
                  }
                  return null;
                },
                controller: widget._passwordController,
                keyboardType: TextInputType.emailAddress,
                obscureText: !widget.passToggle,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Password',
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        widget.passToggle = !widget.passToggle;
                      });
                    },
                    child: Icon(widget.passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: !widget._isDataMatched,
                      child: Text(
                        'Username password doesnot match',
                        style: TextStyle(color: Colors.red),
                      )),
                  //signUpOption(),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     try {
                  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  //         email: widget._emailController.text,
                  //         password: widget._passwordController.text,
                  //       );
                  //
                  //       print("Created a account");
                  //       Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(builder: (context1) => HomePage()),
                  //       );
                  //     } catch (error) {
                  //       print("Error: ${error.toString()}");
                  //     }
                  //   },
                  //   child: Text('Sign Up'),
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.all(16.0),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //     ),
                  //   ),
                  // ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16.0), // Adjust the button's padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Apply rounded corners
                      ),),
                    onPressed: () {
                     if(widget._formkey.currentState!.validate()){
                       checkLogin(context);
                     }else{
                       print("Data empty");
                     }
                    },
                    child: Text("Login"),
                  ),


                ],
              ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?",
              style: TextStyle(
                fontSize: 16,
              ),),
            TextButton(onPressed: ()async {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: widget._emailController.text,
                  password: widget._passwordController.text,
                );

                print("Created a account");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context1) => HomePage()),
                );
              } catch (error) {
                print("Error: ${error.toString()}");
              }
            },
                child: Text("Sign Up",style:
            TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),))
          ],),
              SizedBox(height: 10,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // final provider =
              // Provider.of<GoogleSignInProvider>(context,listen: false);
              // await provider.googleLogin();
              // print("Created a account");
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context1) => HomePage()),
              // );
              ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                   Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context1) => HomePage()),
                      );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2.0,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),),
                    elevation: 3.0,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/github.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  )
              ),
            ],
          )
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async{
    final _username = widget._emailController.text;
    final _password = widget._passwordController.text;

    if (_username == _password) {
      print("Username password match");
      final _sharedPrefs = await SharedPreferences.getInstance();
      await  _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushNamed('/home');
      // Go to home
    } else {
      print("Username password doesnot  match");
      setState(() {
        widget._isDataMatched = false;
      });
      // Show snackbar
      //ScaffoldMessenger.of(context).showSnackBar(
      //SnackBar(content: Text('Username and password do not match')),);


    /*  Row signUpOption(){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don 't have accont",
              style:TextStyle(color: Colors.white70)),
            GestureDetector(
              onTap:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
              child: Text("Sign Up",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            )
          ],
        );
      }*/
    }
  }
}
