import 'package:flutter/material.dart';

class AppBarArgsModel {
  final bool isNeedBottomTab;
  final Widget body;
  final int index;

  AppBarArgsModel(
      {this.isNeedBottomTab = true,
      this.body = const SizedBox(),
      this.index = 0});
}
