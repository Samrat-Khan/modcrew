import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/routes/routeNames.dart';

class ForNotAuthUser extends StatelessWidget {
  final Widget cartBadge;
  const ForNotAuthUser({Key? key, required this.cartBadge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          cartBadge,
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.login);
            },
            child: Text(
              "Log In",
              style: GoogleFonts.ubuntu(
                color: Colors.white,
              ),
            ),
          ),
          // SizedBox(width: 10),
          // TextButton(
          //   onPressed: () {
          //     Navigator.of(context).pushNamed(RouteName.signup);
          //   },
          //   child: Text(
          //     "Sign Up",
          //     style: GoogleFonts.ubuntu(),
          //   ),
          // ),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
