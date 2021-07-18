import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_page/routes/routeNames.dart';

class InfoDialogForError extends StatelessWidget {
  final String title, content;

  const InfoDialogForError({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new TextButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class DoAuthDialog extends StatelessWidget {
  const DoAuthDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Info"),
      content: Text("Please sign up or log in to conitune"),
      actions: <Widget>[
        TextButton(
          child: Text("Log In"),
          onPressed: () {
            Get.toNamed(RouteName.login);
          },
        ),
        TextButton(
          child: Text("Sign In"),
          onPressed: () {
            Get.toNamed(RouteName.signup);
          },
        ),
      ],
    );
  }
}
