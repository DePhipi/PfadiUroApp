import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pfadi_uro/pages/Stuffen/anschlaege/biber.dart';
import 'package:pfadi_uro/pages/start/login.dart';

import 'package:pfadi_uro/pres/cstm_colors.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      //Home View
      body: HomeView(),

      // Bottom Nav Bar
      bottomNavigationBar: BottomNavBar(),
    );
  }
}


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Cstmcolors.light_blue,

      body: Padding (
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),

        child: SingleChildScrollView(
          child: Column(
            children: [

              //App Bar
              const TopBar(),

              const SizedBox(height: 30,),

              //Anschläge

              //Anschläge Title
              Row(
                children: [
                  Icon(Icons.article, color: Cstmcolors.black,),
                  const SizedBox(width: 5),
                  Text(" Anschläge", style: TextStyle(
                    fontSize: 30,
                    color: Cstmcolors.black,
                  ),),
                ],
              ),

              const SizedBox(height: 5,),

              //Biber
              AnschlagCard(
                group: "Biber",
                date: "13.05.",
                start_loc: "Bahnhof Urdorf",
                end_loc: "Bahnhof Urdorf",
                start_time: "15:00",
                end_time: "17:00",
                gestureTapCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BiberAnschlaege()),
                  );
                }
              ),

              //Wölfe
              AnschlagCard(
                  group: "Wölfe",
                  date: "13.05.",
                  start_loc: "Wasserreservoir",
                  end_loc: "Bahnhof Urdorf",
                  start_time: "13:00",
                  end_time: "17:00",
                  gestureTapCallback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }
              ),

              //Pfadis
              AnschlagCard(
                  group: "Pfadis",
                  date: "13.05.",
                  start_loc: "Chinese Hüttli",
                  end_loc: "Holzschopf",
                  start_time: "13:00",
                  end_time: "17:00",
                  gestureTapCallback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }
              ),

              const SizedBox(height: 50,),

              // News

              //News Title
              Row(
                children: [
                  Icon(Icons.local_fire_department, color: Cstmcolors.black,),
                  const SizedBox(width: 5),
                  Text(" News", style: TextStyle(
                    fontSize: 30,
                    color: Cstmcolors.black,
                  ),),
                ],
              ),

              //News Cards
              const NewsCardHolder(cardList: ["1", "2", "3"],),

            ],
          ),
        ),
      )
    );
  }
}


// -- App Bar --
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          //Menu Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                icon: Icon(Icons.account_circle, color: Cstmcolors.dark_green),
                onPressed: () { //#Todo Button Functionality
                },
              ),

              IconButton(
                icon: Icon(Icons.settings, color: Cstmcolors.black),
                onPressed: () { //#Todo Button Functionality
                },
              )
            ],
          ),

          const SizedBox(height: 30,),

          //App Title
          Column(
            children: [

              Row(
                children: [
                  Text("Hallo, ", style: TextStyle(
                    color: Cstmcolors.black,
                    fontSize: 30,
                  ),),

                  Text("Travo!", style: TextStyle( //#Todo get name from Database
                    color: Cstmcolors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),

                ],
              ),

              Row(
                children: [
                  Text("Willkommen bei der Pfadi Uro", style: TextStyle(
                    fontSize: 15,
                    color: Cstmcolors.gray,
                  ),),
                ],
              )
            ],
          ),


        ],
      ),
    );
  }
}


class AnschlagCard extends StatelessWidget {
  const AnschlagCard({
    super.key,
    required this.group,
    required this.date,
    required this.start_loc,
    required this.end_loc,
    required this.start_time,
    required this.end_time,
    required this.gestureTapCallback,
  });

  final String group;
  final String date;
  final String start_loc;
  final String end_loc;
  final String start_time;
  final String end_time;
  final GestureTapCallback gestureTapCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Cstmcolors.white,
      child: GestureDetector(
        onTap: gestureTapCallback, //#Todo Fixx bug (Cant click everywhere inside the box)
        child: Row(
          children: [

            Container(
              decoration: BoxDecoration(
                  color: Cstmcolors.green,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))
              ),
              padding: const EdgeInsets.all(20),
              child: Text(date, style: TextStyle(
                color: Cstmcolors.white,
                fontSize: 25,
              ),),
            ),

            SizedBox(width: 10,),

            Container(
              child: Row(
                children: [
                  Text(group, style: TextStyle(
                    fontSize: 30,
                    color: Cstmcolors.black,
                  ),),

                  const SizedBox(width: 40,), //#Todo Start each item on 2 Row on same axis

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(start_time, style: TextStyle(
                            color: Cstmcolors.black,
                            fontSize: 17
                          ),),

                          SizedBox(width: 10,),

                          Icon(Icons.location_on, size: 17, color: Cstmcolors.gray,),
                          Text(start_loc, style: TextStyle(
                              color: Cstmcolors.gray,
                              fontSize: 17
                          ),)
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 6,),

                          Text("|", style: TextStyle(
                            color: Cstmcolors.black,
                            fontSize: 17,
                          ),),
                        ],
                      ),

                      Row(
                        children: [
                          Text(end_time, style: TextStyle(
                              color: Cstmcolors.black,
                              fontSize: 17
                          ),),

                          SizedBox(width: 10,),

                          Icon(Icons.location_on, size: 17, color: Cstmcolors.gray,),
                          Text(end_loc, style: TextStyle(
                              color: Cstmcolors.gray,
                              fontSize: 17
                          ),)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// -- News Card --
class NewsCardHolder extends StatelessWidget {
  const NewsCardHolder({
    super.key,
    required this.cardList,
  });

  final List cardList; //Todo get news card list data from DB

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          for (var item in cardList) Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12)
              ),
              color: Cstmcolors.dark_green,
            ),

            width: 250,
            margin: const EdgeInsets.only(right: 10),

            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                    ),
                    color: Cstmcolors.white,
                  ),

                  width: 250,
                  height: 150,

                  child: const Center(
                    child: Text("Image"),
                  ),
                ),

                const SizedBox(height: 15,),

                Text("Titel", style: TextStyle(
                  fontSize: 23,
                  color: Cstmcolors.white,
                ),),

                const SizedBox(height: 10,),

                Center(
                  child: Text("Description", style: TextStyle(
                    fontSize: 15,
                    color: Cstmcolors.black,
                  ),),
                )

              ],

            ),
          )
        ],
      ),
    );
  }
}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Cstmcolors.white,
      color: Cstmcolors.black,
      activeColor: Cstmcolors.dark_green,
      gap: 10,
      tabs: const [
        GButton(
          icon: Icons.home_rounded,
          text: "Home",
        ),
        GButton(
          icon: Icons.article,
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
    );
  }
}
