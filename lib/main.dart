import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfadi_uro/pages/start/login.dart';
import 'package:pfadi_uro/pages/start/signup.dart';
import 'package:pfadi_uro/pres/cstm_colors.dart';
import 'firebase_options.dart';

import 'package:pfadi_uro/pages/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(

    theme: ThemeData(
      fontFamily: GoogleFonts.josefinSans().fontFamily,
    ),

    home: Home(),
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


class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String password = ''; // Initialize the password variable
  bool showPassword = false; // Initialize the showPassword flag

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password TextField Example'), // Set the app bar title
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                obscureText: !showPassword, // Toggle password visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value; // Update the password when input changes
                  });
                },
              ),
              SizedBox(height: 10.0), // Add spacing
              ElevatedButton(
                // Call toggleShowPassword when pressed
                onPressed: toggleShowPassword,

                // Change button label based on showPassword flag
                child: Text(showPassword ? 'Hide Password' : 'Show Password'),
              ),
              SizedBox(height: 10.0), // Add spacing
              Text(
                // Display the password or asterisks based on showPassword
                'Password: ${showPassword ? password : '******'}',
                // Apply text style
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

