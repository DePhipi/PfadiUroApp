import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/start/signup.dart';

import 'login.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text("Pfadi Uro"),
            bottom: const TabBar(
                tabs: [
                  Tab(text: "Login"),
                  Tab(text: "Signup"),
              ],
            ),
          ),
          body: const TabBarView(
              children: [
                LoginCard(),
                SignupCard(),
              ]
          ),
        )
    );
  }
}
