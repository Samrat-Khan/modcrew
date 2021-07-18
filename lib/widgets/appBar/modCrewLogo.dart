import 'package:flutter/material.dart';

class ModCrewLogo extends StatelessWidget {
  const ModCrewLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        ModalRoute.of(context)!.settings.name == '/'
            ? null
            : Navigator.of(context).pushNamed('/');
      },
      child: Container(
        width: 190,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
