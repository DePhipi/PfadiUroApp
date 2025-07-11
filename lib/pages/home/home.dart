import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pfadi_uro/pages/Services/db_service.dart';
import 'package:pfadi_uro/pages/Stuffen/anschlaege/biber.dart';
import 'package:pfadi_uro/pages/home/profile.dart';
import 'package:pfadi_uro/pages/start/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pfadi_uro/pages/stuffen/anschlaege/pfadis.dart';
import 'package:pfadi_uro/pages/stuffen/anschlaege/woelfe.dart';

import '../../presets/cstm_colors.dart';

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

              //Biber
              AnschlagCard( //Todo get Data from DB
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
                      MaterialPageRoute(builder: (context) => const WoelfeAnschlaege()),
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
                      MaterialPageRoute(builder: (context) => const PfadiAnschlaege()),
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

          SizedBox(height: 30,),

          //Menu Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      Icons.account_circle, color: Cstmcolors.dark_green,
                      size: 30,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileView()),
                      );
                      print("open");
                    },
                  );
                }
              ),

              IconButton(
                icon: Icon(Icons.settings, color: Cstmcolors.black, size: 30,),
                onPressed: () {
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

                  FutureBuilder<String>(
                    future: DBService.fetchUserData('name'),

                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return Text('no data');
                        } else {
                          return Text(snapshot.data, style: TextStyle( //#Todo get name from Database
                            color: Cstmcolors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),);
                        }
                      } else if (snapshot.connectionState == ConnectionState.none) {
                        return Text('Error'); // error
                      } else {
                        return CircularProgressIndicator(); // loading
                      }
                    },
                  ),

                ],
              ),

              Row(
                children: [
                  Text("Willkommen bei der Pfadi Uro", style: TextStyle(
                    fontSize: 15,
                    color: Cstmcolors.grey,
                  ),),
                ],
              )
            ],
          ),


        ],
      ),
    );
  }

  _fetch() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid.toString();

    if (currentUser != null){
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('users/$currentUserUid/name').get();
      if (snapshot.exists) {
        return snapshot.value.toString();
      } else {
        return("");
      }
    }

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
              width: 115,
              child: Text(group, style: TextStyle(
                  color: Cstmcolors.white,
                  fontSize: 25,
                  ),),
                ),

            const SizedBox(width: 5,),

            Container(

              //color: Colors.white,
              child: Row(
                children: [
                  //Text(group, style: TextStyle(
                  //  fontSize: 25,
                  //  color: Cstmcolors.black,
                  //),),

                  const SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(start_time, style: TextStyle(
                            color: Cstmcolors.black,
                            fontSize: 15
                          ),),

                          const SizedBox(width: 10,),

                          Icon(Icons.location_on, size: 17, color: Cstmcolors.grey,),
                          Text(start_loc, style: TextStyle(
                              color: Cstmcolors.grey,
                              fontSize: 15
                          ),)
                        ],
                      ),

                      const Row(
                        children: [
                          Icon(Icons.more_vert, size: 20,),
                        ],
                      ),

                      Row(
                        children: [
                          Text(end_time, style: TextStyle(
                              color: Cstmcolors.black,
                              fontSize: 15
                          ),),

                          SizedBox(width: 10,),

                          Icon(Icons.location_on, size: 17, color: Cstmcolors.grey,),
                          Text(end_loc, style: TextStyle(
                              color: Cstmcolors.grey,
                              fontSize: 15
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
    return SafeArea(
      child: GNav(
        backgroundColor: Cstmcolors.white,
        color: Cstmcolors.black,
        activeColor: Cstmcolors.dark_green,
        gap: 10,
        //iconSize: 20,
        //textSize: 5,
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: "Home",
          ),
          GButton(
            icon: Icons.people,
            text: "Anmeldungen",
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
    );
  }
}
