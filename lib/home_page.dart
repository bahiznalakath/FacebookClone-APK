import 'package:facebook_clone/google_sign_in.dart';
import 'package:facebook_clone/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Facebook Clone',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(Icons.search,
                  color: Colors.black,)
            ),
            IconButton(onPressed: () {},
                icon: Icon(Icons.message,
                    color: Colors.blue)
            ),
            IconButton(onPressed: () {
              signOut(BuildContext);
            },
                icon: Icon(Icons.exit_to_app,
                  color: Colors.black,)
            ),
          ],
          //tab Bar
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.group),),
              Tab(icon: Icon(Icons.ondemand_video),),
              Tab(icon: Icon(Icons.notifications_none),),
              Tab(icon: Icon(Icons.message),)
            ],
          ),

        ),
//tab bar view

        body: TabBarView(
          children: [
            Icon(Icons.home),
            Icon(Icons.group),
            Icon(Icons.ondemand_video),
            Icon(Icons.notifications_none),
            Icon(Icons.message)
          ],
        ),
      ),
    );
  }

  void signOut(BuildContext) async {
    try {
      // await FirebaseAuth.instance.signOut();
      // print("Signout successful");
     // await FirebaseServices().signOut();
      await FirebaseAuth.instance.currentUser?.delete();
      print('User login data deleted successfully.');
      Navigator.of(context).pushNamedAndRemoveUntil( '/login', (route) => true);

    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }
}


