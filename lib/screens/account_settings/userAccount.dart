import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shopping_page/const_and_theme/textStyles.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/dummyData/orderHistroy.dart';
import 'package:shopping_page/dummyData/profileData.dart';
import 'package:shopping_page/models/userModel.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutTemplate(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AccountDetailsCard(
                    size: size,
                    nameController: _nameController,
                    numberController: _numberController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController),
                OrderHistoryCard(size: size),
              ],
            ),
            SizedBox(height: 50),
            DividerMessage(),
            SizedBox(height: 50),
            Footer(),
          ],
        ),
      ),
    );
  }

  popUpForAddReview() {}
}

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
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
  Widget build(BuildContext context) {
    final ProfileData data = profileData[0];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.35,
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
                          image: AssetImage(data.imagePath),
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
                  children: [
                    Text(
                      "Address:",
                      style: Styles.contentTitleStyle,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Adress"),
                    ),
                  ],
                ),
                model.addressBook.isEmpty
                    ? Center(
                        child: Text("Data no added"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.address.length,
                        itemBuilder: (context, index) {
                          UserAddress address = data.address[index];
                          return ListTile(
                            title: Text(
                              address.address,
                              style: Styles.contentStyle,
                            ),
                            subtitle: Text(
                              address.primary ? "Default" : "",
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
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.6,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Order History",
              style: Styles.contentTitleStyle,
            ),
            SizedBox(height: 15),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(orderHistory[index].imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    "${orderHistory[index].productName}",
                    style: Styles.contentStyle,
                  ),
                  subtitle: Text(
                    "${orderHistory[index].productPrice} x ${orderHistory[index].buyedProductNo} = \$${orderHistory[index].totalPrice}",
                    style: Styles.subContentStyle,
                  ),
                  trailing: orderHistory[index].isUserGivenReview
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : ElevatedButton(
                          child: Text(
                            "Add Review",
                            style: GoogleFonts.ubuntu(),
                          ),
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return PopupReviewProduct();
                            //   },
                            // );
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
              backgroundImage: AssetImage("assets/images/u4.png"),
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
