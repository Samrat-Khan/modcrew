import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Customtheme.lightTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: InputBorder.none,
          hintText: "Search",
          suffixIcon: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        textAlign: TextAlign.justify,
        style: GoogleFonts.ubuntu(
          fontSize: 16,
        ),
      ),
    );
  }
}
