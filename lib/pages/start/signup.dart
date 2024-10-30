import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/start/login.dart';

import '../../presets/cstm_colors.dart';
import '../Services/auth_service.dart';
import '../home/home.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Cstmcolors.green,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 100),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Text("ACCOUNT", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),),

                  const Text("ERSTELLEN", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),),

                  const SizedBox(height: 40,),

                  // Input Fields
                  const InputFields(),

                  const SizedBox(height: 20,),

                  //Create Account Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Bereits einen Account?", style: TextStyle(
                        color: Cstmcolors.black,
                        fontSize: 13,
                      ),),

                      const SizedBox(width: 5,),

                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Anmelden",
                                    style: TextStyle(
                                      color: Cstmcolors.gray,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),

                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const LoginView()),
                                        );
                                      }
                                )
                              ]
                          )
                      )
                    ],
                  )

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}


class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isTextObscured = true;

  void _toggle() {
    _isTextObscured = !_isTextObscured;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //User Name Input Field
        TextField(
          controller: _userNameController,
          cursorColor: Cstmcolors.black,
          style: TextStyle(
            color: Cstmcolors.black,
          ),

          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Cstmcolors.black)
            ),
            icon: Icon(Icons.person, color: Cstmcolors.green,),
            labelText: "Benutzername",
            labelStyle: TextStyle(
              color: Cstmcolors.black,
            ),

          ),
        ),

        const SizedBox(height: 5,),

        //Email Input Field
        TextField(
          controller: _emailController,
          cursorColor: Cstmcolors.black,
          style: TextStyle(
            color: Cstmcolors.black,
          ),

          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Cstmcolors.black)
            ),
            icon: Icon(Icons.email, color: Cstmcolors.green,),
            labelText: "Email",
            labelStyle: TextStyle(
              color: Cstmcolors.black,
            ),

          ),
        ),

        const SizedBox(height: 5,),

        //Password Input Field
        TextField(
          controller: _passwordController,
          obscureText: _isTextObscured,
          obscuringCharacter: "*",
          cursorColor: Cstmcolors.black,
          style: TextStyle(
            color: Cstmcolors.black,
          ),

          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Cstmcolors.black)
              ),

              icon: Icon(Icons.lock, color: Cstmcolors.green,),
              labelText: "Passwort",
              labelStyle: TextStyle(
                color: Cstmcolors.black,
              ),

              suffixIcon: IconButton(
                icon: _isTextObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),

                onPressed: () {
                  _toggle();
                  setState(() {});
                },
              )
          ),
        ),

        const SizedBox(height: 30,),

        //Login Button
        ElevatedButton(
            child: Text("ERSTELLEN", style: TextStyle(
              color: Cstmcolors.black,
              fontSize: 15,
            ),),

            style: ElevatedButton.styleFrom(

              backgroundColor: Cstmcolors.green,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            onPressed: () async {
;
              final msg = await AuthService().registration(
                userName: _userNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
              );

              if (msg!.contains("Succes")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                ),
              );
            }
        ),

      ],
    );


  }
}