import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_page/const_and_theme/colors.dart';

class LoadingSpiner extends StatelessWidget {
  const LoadingSpiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Color(primaryColor) : Color(textFieldBg),
          ),
        );
      },
    );
  }
}
