import 'package:facebook_clone/home_page.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Set the border radius
                    ),
                    hintText: 'Username',
                    labelText: 'Username', // Changed from 'label' to 'labelText'
                    icon: Icon(Icons.mail),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Set the border radius
                    ),
                    hintText: 'Email',
                    icon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                  controller: _passwordController,
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
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform sign-up logic here
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Validate input and register the user
                    if (_validateInput(username, email, password)) {
                      _registerUser(username, email, password);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context1)=> HomePage()));
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateInput(String username, String email, String password) {
    // Perform your validation logic here
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }

  void _registerUser(String username, String email, String password) {
    // Perform user registration logic here
    // You can send the data to a server or store it locally
    print('User Registered: $username, $email, $password');
  }
}
