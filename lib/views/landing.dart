import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twigconnect/core/featursKeys.dart';
import 'package:twigconnect/core/firebase_provider.dart';
import 'package:twigconnect/utils/colors.dart';
import 'package:twigconnect/utils/utils.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  Future<void> addUser() {
    FirebaseProvider firebaseProvider = FirebaseProvider(collectionId: "users");
    return firebaseProvider.collectionObj
        .add({
          'full_name': "Esasm", // John Doe
          'company': "Esasm", // Stokes and Sons
          'age': 56 // 42
        })
        .then((value) => print("User Added ${value}"))
        .catchError((error) => print("ssssssssssssssssssssssssssss"));
  }

  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: primaryColor),
    );

    final logo = Container(
      height: 100.0,
      width: 100.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AvailableImages.appLogo,
          fit: BoxFit.cover,
        ),
      ),
    );

    final appName = Column(
      children: const <Widget>[
        Text(
          AppConfig.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        Text(
          AppConfig.appTagline,
          style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),
        )
      ],
    );

    final loginBtn = InkWell(
      onTap: () => Navigator.pushNamed(context, loginViewRoute),
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
          color: Colors.transparent,
        ),
        child: const Center(
          child: Text(
            'LOG IN',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    final registerBtn = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.pushNamed(context, registerViewRoute),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: const Text(
          'SIGN UP',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );

    final buttons = Padding(
      padding: const EdgeInsets.only(
        top: 80.0,
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        children: <Widget>[loginBtn, const SizedBox(height: 20.0), registerBtn],
      ),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 70.0),
              decoration: const BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: addUser,
                      child: const Text(
                        "Add User",
                      )),
                  logo,
                  appName,
                  buttons
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AvailableImages.homePage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
