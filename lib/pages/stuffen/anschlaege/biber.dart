import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/home.dart';

import '../../../pres/cstm_colors.dart';

class BiberAnschlaege extends StatelessWidget {
  const BiberAnschlaege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cstmcolors.light_blue,
      body: Center(
        child: Column(
          children: [

            const TopBar(),

            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                children: [

                  Container(
                    decoration: BoxDecoration(
                        color: Cstmcolors.dark_green,
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                        ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("start_time", style: TextStyle(
                                  color: Cstmcolors.white,
                                  fontSize: 25
                              ),),

                              const SizedBox(width: 10,),

                              Icon(Icons.location_on, size: 25, color: Cstmcolors.green,),
                              Text("start_loc", style: TextStyle(
                                  color: Cstmcolors.green,
                                  fontSize: 25
                              ),)
                            ],
                          ),

                          Icon(Icons.more_vert,
                            color: Cstmcolors.white,
                          ),

                          Row(
                            children: [
                              Text("end_time", style: TextStyle(
                                  color: Cstmcolors.white,
                                  fontSize: 25
                              ),),

                              const SizedBox(width: 10,),

                              Icon(Icons.location_on, size: 25, color: Cstmcolors.green,),
                              Text("end_loc", style: TextStyle(
                                  color: Cstmcolors.green,
                                  fontSize: 25
                              ),)
                            ],
                          ),

                          const SizedBox(height: 10,)

                        ],
                      ),
                    ),

                ),]
              ),
            ),
          ],
        ),
      )
    );
  }
}


class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Cstmcolors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10,),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Cstmcolors.black,
                iconSize: 25,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 5,),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Biber", style: TextStyle(
                    fontSize: 25,
                  ),),

                  SizedBox(height: 5,),
                ],
              ),
            ],
          ),
        )



    );
  }
}

