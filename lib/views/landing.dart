import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LandingPage extends StatelessWidget {
  final String fullName = "Esasm ";
  final String company = "Essma";
  final int age = 89;

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age,
            'test': {
              'first': "1",
              'test2': {'sss': 1}
            }
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: Column(children: [
        SizedBox(height: 100,),
        TextButton(
          onPressed: addUser,
          child: const Text(
            "Add User",
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Container(
              height: 500,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data.toString()),
                  );
                }).toList(),
              ),
            );
          },
        )
      ]),
    );
  }
}
