import 'package:flutter/material.dart';
import 'package:shopping_page/screens/screens.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: Container(
        child: Center(
          child: Column(
            children: [
              Text("About Modcrew"),
              Container(
                width: size.width * 0.35,
                child: Text(message),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String message =
      'What is modcrew With a vision of having a merchandise brand totally focussed towards the automobile enthusiasts, to all the racing fans out there, we bring you Modcrew is all about speed, race, gears, and everything that excites you about the adventurous sport. We understand the thrill coursing through your veins and the desire to take a part of this excitement back home, and we enable you with all the merchandise that you need for your collection as a fan.';
}
