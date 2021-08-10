import 'package:flutter/material.dart';

class DropDownCustom extends StatefulWidget {
  final Function(Object?) onChange;
  const DropDownCustom({Key? key, required this.onChange}) : super(key: key);

  @override
  _DropDownCustomState createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  final List<String> stateList = [
    "Select",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
  String selectedState = "Select";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: stateList.map<DropdownMenuItem<String>>(
        (e) {
          return DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          );
        },
      ).toList(),
      value: selectedState,
      onChanged: (val) {
        widget.onChange(val);
        setState(() {
          selectedState = val as String;
        });
      },
    );
  }
}
