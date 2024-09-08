import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:pfadi_uro/pages/home.dart';
import 'package:pfadi_uro/pages/start/tabbar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: Home()
  ));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: const Center(
        child: Column(
          children: [

            //Title
            Text("WILLKOMMEN", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),),

            //Login Card
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("data"),
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
