import 'package:flutter/material.dart';
import 'package:shopping_page/routes/routeNames.dart';

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
            : Navigator.of(context).pushNamed(RouteName.home);
      },
      child: Container(
        width: 190,
        height: 60,
        // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
