import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../pres/cstm_colors.dart';

class BiberAnschlaege extends StatelessWidget {
  const BiberAnschlaege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Cstmcolors.green,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  

                  Spacer(),

                  Text("Biber"),


                  Spacer(),

                ],
              ),
            ),

            Container()
          ],
        ),
      )
    );
  }
}
