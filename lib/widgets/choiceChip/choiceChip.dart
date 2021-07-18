import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChipChoice extends StatefulWidget {
  final String filter;
  final Function(bool) action;
  final Color color;
  final bool isAvaterNeed;
  final IconData avater;
  final bool isSelected;
  const CustomChipChoice({
    Key? key,
    required this.action,
    required this.filter,
    required this.color,
    this.avater = Icons.arrow_downward,
    this.isSelected = false,
    this.isAvaterNeed = false,
  }) : super(key: key);

  @override
  _CustomChipChoiceState createState() => _CustomChipChoiceState();
}

class _CustomChipChoiceState extends State<CustomChipChoice> {
  bool _isSelected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChoiceChip(
        avatar: !widget.isAvaterNeed
            ? Text(
                widget.filter[0].toUpperCase(),
                style: GoogleFonts.ubuntu(
                    color: widget.isSelected ? Colors.white : Colors.black),
              )
            : Icon(
                widget.avater,
                color: widget.isSelected ? Colors.white : Colors.black,
              ),
        backgroundColor: Colors.white,
        selectedColor: widget.isSelected ? widget.color : Colors.white,
        label: Text(
          widget.filter,
          style: GoogleFonts.ubuntu(
              color: widget.isSelected ? Colors.white : Colors.black),
        ),
        selected: widget.isSelected,
        onSelected: (val) {
          setState(() {
            _isSelected = !_isSelected;
          });

          widget.action(_isSelected);
        },
      ),
    );
  }
}
