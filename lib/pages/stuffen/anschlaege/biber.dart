import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfadi_uro/pages/home/home.dart';

import '../../../presets/cstm_colors.dart';

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
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Biber", style: TextStyle(
                      color: Cstmcolors.black,
                      fontSize: 50
                  ),),
                  Text("25.04", style: TextStyle(
                      color: Cstmcolors.grey,
                      fontSize: 25
                  ),),
                ],
              ),
            ),



            const SizedBox(height: 30,),

            Expanded(
              child: Container(
                width: double.infinity,
                height: 700,
              
                decoration: BoxDecoration(
                  color: Cstmcolors.black,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22)
                  )
                ),

                child: const Column(
                  children: [

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
