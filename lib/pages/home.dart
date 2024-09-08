import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // Home View
      body: const Column(
        children: [
          // Title Sector
          Card(
            
            color: Colors.red,
            margin: EdgeInsets.all(25),
            child: Text("data"),
          ),

          Text("Pfadi URO", style: TextStyle(
            color: Colors.white,
          ),),



          SizedBox(
            height: 50,
            child: Text("data", style: TextStyle(
              backgroundColor: Colors.white,
            ),),
          ),

          Image(image: AssetImage("assets/forest_silhouette.png")),


        ],
      ),

      
      // Bottom Nav Bar
      bottomNavigationBar: Container(
        child: GNav(
          backgroundColor: Color.fromRGBO(8, 8, 8, 100),
          color: Colors.white,
          activeColor: Colors.green[300],
          gap: 10,
          tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: "Home",
          ),
          GButton(
            icon: Icons.local_fire_department,
            text: "Anschläge",
          ),
          GButton(
            icon: Icons.people,
            text: "Stuffen",
          ),
          GButton(
            icon: Icons.calendar_month,
            text: "Kalender",
          ),
          GButton(
            icon: Icons.more_vert,
            text: "Mehr",
          ),
          ],
        ),
      ),
    );
  }
}
