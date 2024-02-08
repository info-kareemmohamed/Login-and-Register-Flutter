import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab/utils/app_colors.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _auth.currentUser != null
          ? FirebaseFirestore.instance
          .collection("Users")
          .doc(_auth.currentUser!.uid)
          .snapshots()
          : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            var data = snapshot.data!.data() as Map<String, dynamic>?;

            if (data != null) {
              return Scaffold(
                   backgroundColor: AppColors.darkTheme,
                body: SafeArea(

                  child: Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('Name: ${data['name'] ?? ""} ',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),

                  ),
                        Text('Email: ${data['email'] ?? ""} ',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),

                        ),
                        // Do not display password for security reasons
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          } else {
            return Center(
              child: Text('No data found'),
            );
          }
        }
      },
    );
  }
}