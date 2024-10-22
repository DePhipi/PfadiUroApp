import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/start/login.dart';

import '../../pres/cstm_colors.dart';
import '../auth_service.dart';
import '../home.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Cstmcolors.green,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 120, 30, 120),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  const SizedBox(height: 70,),

                  const Text("SIGNUP", style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),),

                  const SizedBox(height: 80,),

                  // Password Input Field
                  const InputFields(),

                  const SizedBox(height: 20,),

                  //Create Account Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text("Du hast schon einen Account?"),

                      const SizedBox(width: 5,),

                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Anmelden",
                                    style: TextStyle(
                                      color: Cstmcolors.gray,
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

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isTextObscured = true;

  void _toggle() {
    _isTextObscured = !_isTextObscured;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

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
            icon: Icon(Icons.person, color: Cstmcolors.green,),
            labelText: "Email",
            labelStyle: TextStyle(
              color: Cstmcolors.black,
            ),

          ),
        ),

        const SizedBox(height: 20,),

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

        const SizedBox(height: 50,),

        //Login Button
        ElevatedButton(
            child: Text("SIGNUP", style: TextStyle(
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