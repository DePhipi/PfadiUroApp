import 'package:flutter/material.dart';

import 'package:pfadi_uro/pres/cstm_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  var _isTextObscured = false;
  @override
  void initState() {
    super.initState();
    _isTextObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cstmcolors.light_blue,

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
          
              // Password Input Field
              TextField(
                obscureText: _isTextObscured,
                obscuringCharacter: "*",
                cursorColor: Cstmcolors.black,
                style: TextStyle(
                  color: Cstmcolors.black,
                ),

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _isTextObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    onPressed: () {
                      print(_isTextObscured);
                      setState();
                    }
                  ),

                  filled: true,
                  fillColor: Cstmcolors.white,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: "Passwort",
                  
                  icon: const Icon(Icons.lock),
                ),
                
              ),

            ],
          
          ),
        ),
      ),
    );
  }

  void setState() {
    _isTextObscured = !_isTextObscured;
  }
}
