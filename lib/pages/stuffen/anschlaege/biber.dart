import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/home/home.dart';

import '../../../presets/cstm_colors.dart';
import '../../Services/db_service.dart';

class BiberAnschlaege extends StatelessWidget {
  const BiberAnschlaege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cstmcolors.light_blue,
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 10,),

            Container(
              child: Align(
                alignment: Alignment.topLeft,

                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Cstmcolors.black,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            SizedBox(height: 20,),

            Align(
              alignment: Alignment.center,
              child: Padding(
                
                padding: EdgeInsets.all(10),
                
                child: Column(

                  children: [
                    Text("Biber", style: TextStyle(
                        color: Cstmcolors.black,
                        fontSize: 50
                    ),),

                    //Text Date
                    FutureBuilder<String>(
                      future: DBService.fetchData("anschlaege", "biber", "date"),

                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (!snapshot.hasData) {
                            return Text('Loading Data...', style: TextStyle(
                                color: Cstmcolors.white,
                                fontSize: 20
                            ),);
                          } else {
                            return Text(snapshot.data, style: TextStyle(
                                color: Cstmcolors.grey,
                                fontSize: 25
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
              ),
            ),

            const SizedBox(height: 50,),

            Expanded(
              child: Container(
                width: double.infinity,
              
                decoration: BoxDecoration(
                  color: Cstmcolors.black,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22)
                  )
                ),

                child: SingleChildScrollView(
                  child: Padding(

                    padding: const EdgeInsets.all(30),

                    child: Column(
                      children: [

                        SizedBox(height: 50,),

                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                              color: Cstmcolors.green,
                              size: 30,
                            ),


                            //Text Start Location
                            FutureBuilder<String>(
                              future: DBService.fetchData("anschlaege", "biber", "start_loc"),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (!snapshot.hasData) {
                                    return Text('Loading Data...', style: TextStyle(
                                      color: Cstmcolors.white,
                                      fontSize: 20
                                    ),);
                                  } else {
                                    return Text(snapshot.data, style: TextStyle(
                                        color: Cstmcolors.white,
                                        fontSize: 20
                                    ),);
                                  }
                                } else if (snapshot.connectionState == ConnectionState.none) {
                                  return Text('Error'); // error
                                } else {
                                  return CircularProgressIndicator(); // loading
                                }
                              },
                            ),

                            SizedBox(width: 20,),

                            Icon(Icons.access_time_outlined,
                              color: Cstmcolors.grey,
                              size: 25,
                            ),

                            //Text Start Time
                            FutureBuilder<String>(
                              future: DBService.fetchData("anschlaege", "biber", "start_time"),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (!snapshot.hasData) {
                                    return Text('Loading Data...', style: TextStyle(
                                        color: Cstmcolors.white,
                                        fontSize: 20
                                    ),);
                                  } else {
                                    return Text(snapshot.data, style: TextStyle(
                                        color: Cstmcolors.grey,
                                        fontSize: 20
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

                        const SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.more_vert, color: Cstmcolors.white, size: 30,),
                          ],
                        ),

                        const SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                              color: Cstmcolors.green,
                              size: 30,
                            ),

                            //Text End Location
                            FutureBuilder<String>(
                              future: DBService.fetchData("anschlaege", "biber", "end_loc"),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (!snapshot.hasData) {
                                    return Text('Loading Data...', style: TextStyle(
                                        color: Cstmcolors.white,
                                        fontSize: 20
                                    ),);
                                  } else {
                                    return Text(snapshot.data, style: TextStyle(
                                        color: Cstmcolors.white,
                                        fontSize: 20
                                    ),);
                                  }
                                } else if (snapshot.connectionState == ConnectionState.none) {
                                  return Text('Error'); // error
                                } else {
                                  return CircularProgressIndicator(); // loading
                                }
                              },
                            ),

                            SizedBox(width: 20,),

                            Icon(Icons.access_time_outlined,
                              color: Cstmcolors.grey,
                              size: 25,
                            ),

                            //Text End Time
                            FutureBuilder<String>(
                              future: DBService.fetchData("anschlaege", "biber", "end_time"),

                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (!snapshot.hasData) {
                                    return Text('Loading Data...', style: TextStyle(
                                        color: Cstmcolors.white,
                                        fontSize: 20
                                    ),);
                                  } else {
                                    return Text(snapshot.data, style: TextStyle(
                                        color: Cstmcolors.grey,
                                        fontSize: 20
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

                        const SizedBox(height: 70,),

                        Row(
                          children: [
                            Icon(Icons.backpack_outlined, color: Cstmcolors.green, size: 30,),

                            Flexible(
                              child: FutureBuilder<String>(
                                future: DBService.fetchData("anschlaege", "biber", "comment"),

                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (!snapshot.hasData) {
                                      return Text('Loading Data...', style: TextStyle(
                                          color: Cstmcolors.white,
                                          fontSize: 20
                                      ),);
                                    } else {
                                      return Text(snapshot.data, style: TextStyle(
                                          color: Cstmcolors.white,
                                          fontSize: 20
                                      ),);
                                    }
                                  } else if (snapshot.connectionState == ConnectionState.none) {
                                    return Text('Error'); // error
                                  } else {
                                    return CircularProgressIndicator(); // loading
                                  }
                                },
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 120,),

                        Text("Mit Freud debii!", style: TextStyle(
                          color: Cstmcolors.white,
                          fontSize: 30
                        ),)

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
