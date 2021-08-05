import 'package:flutter/material.dart';
import 'package:shopping_page/widgets/widgets.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool needMultiline;
  final double widthVal;
  final Size size;
  final String hintText;
  final Function(String?) valiadtor;
  final bool isPassword, isNeedMaxLength;

  const CustomTextField({
    Key? key,
    required this.size,
    this.widthVal = 0.2,
    this.needMultiline = false,
    required this.hintText,
    required this.controller,
    required this.valiadtor,
    this.isPassword = false,
    this.isNeedMaxLength = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = false;
  switchIcon() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var desktop = Responsive.isDesktop(context);

    return Container(
      width: desktop
          ? widget.size.width * widget.widthVal
          : widget.size.width * 0.6,
      height: widget.needMultiline ? 150 : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        maxLength: widget.isNeedMaxLength ? 5 : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) => widget.valiadtor(val),
        keyboardType:
            widget.needMultiline ? TextInputType.multiline : TextInputType.name,
        maxLines: null,
        minLines: null,
        expands: widget.needMultiline,
        obscureText: widget.isPassword ? true : false,
        decoration: InputDecoration(
          suffixIcon: _isVisible
              ? IconButton(
                  onPressed: switchIcon,
                  icon: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off))
              : null,
          filled: true,
          contentPadding: EdgeInsets.only(left: 10),
          border: InputBorder.none,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
