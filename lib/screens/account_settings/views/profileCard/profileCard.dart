import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../../screens.dart';

class AccountDetailsCard extends StatefulWidget {
  AccountDetailsCard({
    Key? key,
    required this.size,
    required TextEditingController nameController,
    required TextEditingController numberController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  })  : _nameController = nameController,
        _numberController = numberController,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        super(key: key);

  final Size size;
  final TextEditingController _nameController;
  final TextEditingController _numberController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  _AccountDetailsCardState createState() => _AccountDetailsCardState();
}

class _AccountDetailsCardState extends State<AccountDetailsCard> {
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController nearLandMarkController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  String selectedState = "Select";

  @override
  void dispose() {
    super.dispose();
    addressLineController.dispose();
    nearLandMarkController.dispose();
    pinCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: widget.size.width * 0.35,
        // height: size.height * .35,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: GetBuilder<AuthController>(
          builder: (controller) {
            UserDataModel model = controller.userData.value[0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/u7.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.firstName + " " + model.lastName,
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          model.phone.toString(),
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopupEditProfile();
                          },
                        );
                      },
                      icon: Icon(Icons.edit, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Email: ",
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: model.email,
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Address:",
                      style: Styles.contentTitleStyle,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Address"),
                    ),
                  ],
                ),
                model.addressBook.isEmpty
                    ? Center(
                        child: Text("Data no added"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "address.address",
                              style: Styles.contentStyle,
                            ),
                            subtitle: Text(
                              "address.primary ? Default",
                              style: Styles.subContentStyle,
                            ),
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Default"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text("Delete"),
                                  value: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            );
          },
        ),
      ),
    );
  }

  updateAdress() {
    return showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Address"),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Save"),
              ),
            ],
            content: Container(
              width: size.width * 0.34,
              height: 250,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textField(
                          size: size,
                          hintText: "Address Line",
                          controller: addressLineController),
                      textField(
                          size: size,
                          hintText: "Nearest Landmark",
                          controller: nearLandMarkController),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textField(
                          size: size,
                          hintText: "City",
                          controller: cityController),
                      textField(
                        size: size,
                        hintText: "Pincode",
                        controller: pinCodeController,
                        isPinCode: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropDownCustom(
                        onChange: (val) {
                          setState(() {
                            selectedState = val as String;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Container textField(
      {required Size size,
      required String hintText,
      required TextEditingController controller,
      bool isPinCode = false}) {
    return Container(
      width: size.width * 0.15,
      height: 70,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        maxLength: isPinCode ? 6 : null,
        keyboardType:
            isPinCode ? TextInputType.number : TextInputType.streetAddress,
        inputFormatters: [
          isPinCode
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          filled: true,
          fillColor: Color(textFieldBg),
        ),
      ),
    );
  }
}

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

// ignore: must_be_immutable
class PopupEditProfile extends StatelessWidget {
  PopupEditProfile({
    Key? key,
  }) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text("Edit Profile"),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/u7.png"),
            ),
            SizedBox(height: 15),
            CustomTextField(
              size: size,
              hintText: "Name",
              controller: _nameController,
              valiadtor: (value) {},
            ),
            SizedBox(height: 15),
            CustomTextField(
              size: size,
              hintText: "Mobile No",
              controller: _phoneController,
              valiadtor: (value) {},
            ),
            SizedBox(height: 15),
            CustomTextField(
              size: size,
              hintText: "Email",
              controller: _emailController,
              valiadtor: (value) {},
            ),
            SizedBox(height: 15),
            CustomTextField(
              size: size,
              hintText: "New Password",
              controller: _newPasswordController,
              valiadtor: (value) {},
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Save"),
        ),
      ],
    );
  }
}
