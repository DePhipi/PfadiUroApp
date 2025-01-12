import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfadi_uro/pages/Services/db_service.dart';
import 'package:pfadi_uro/pages/Stuffen/anschlaege/biber.dart';
import 'package:pfadi_uro/pages/start/login.dart';
import 'package:pfadi_uro/pages/start/signup.dart';
import 'package:pfadi_uro/presets/cstm_colors.dart';
import 'firebase_options.dart';

import 'package:pfadi_uro/pages/home/home.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(

    theme: ThemeData(
      fontFamily: GoogleFonts.josefinSans().fontFamily,
    ),

    home: const Home(),
  ));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 10),
        color: Cstmcolors.green,
        child: Column(
          children: [

            //Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10,),
                Text("group", style: TextStyle(
                  color: Cstmcolors.white,
                  fontSize: 20,
                ),),

                const SizedBox(width: 10),

                const Text("date", style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),),

                Card(

                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          Text("start_time"),

                          SizedBox(width: 20,),

                          Icon(Icons.location_on_outlined),
                          Text("start_loc"),
                        ],
                      ),

                      Text("|", style: TextStyle(
                        backgroundColor: Cstmcolors.black,
                      ),),

                    ],
                  ),

                ),

              ],


            ),

            //Body

          ],
        )
    );
  }
}