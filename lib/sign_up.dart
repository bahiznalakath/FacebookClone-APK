import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 35,),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Value is empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Username',
                      labelText: 'Username',
                      icon: Icon(Icons.man_sharp),
                    ),

                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Value is empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Email',
                      labelText: 'Email',
                      icon: Icon(Icons.mail),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Value is empty";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                      icon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your sign-up logic here
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
    // bool _validateInput(String username, String email, String password) {
    //   // Perform your validation logic here
    //   if (username.isEmpty || email.isEmpty || password.isEmpty) {
    //     return false;
    //   }
    //   return true;
    // }
    //
    // void _registerUser(String username, String email, String password) {
    //   // Perform user registration logic here
    //   // You can send the data to a server or store it locally
   // //   print('User Registered: $username, $email, $password');
