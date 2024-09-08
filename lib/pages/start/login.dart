import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green,
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Passwort"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  //Button Press
                },
                child: const Text("Login")
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
