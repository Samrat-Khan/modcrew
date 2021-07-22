import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/routes/routeNames.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  serachProduct() async {
    widget._controller.clear();
    Navigator.of(context)
        .pushNamed(RouteName.search, arguments: widget._controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Customtheme.lightTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget._controller,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: InputBorder.none,
          hintText: "Search",
          suffixIcon: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: serachProduct,
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
