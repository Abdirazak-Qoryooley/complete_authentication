import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
         IconButton(
  icon: Icon(Icons.logout),
  onPressed: () async {
    // Log out the user
    await FirebaseAuth.instance.signOut();
    
    // Navigate to the login screen using the correct route name
    Navigator.pushReplacementNamed(context, '/login');
  },
),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? Center(
                child: Text(
                  'No user is logged in.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : Center(
              child: Column(
                
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Text(
                        user.email![0].toUpperCase(),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome,',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      user.email ?? 'User',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 30),
              //                   ElevatedButton(
              //   onPressed: () async {
              //     Clipboard.setData(ClipboardData(text: user.email ?? 'No email available'));
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text('Email copied to clipboard!')),
              //     );
              //   },
              //   child: Text(''),
              // ),
              
                  ],
                ),
            ),
      ),
    );
  }
}
