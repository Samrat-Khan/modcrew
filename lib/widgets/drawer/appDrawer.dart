import 'package:flutter/material.dart';
import 'package:shopping_page/screens/templateLayout/mobileTemplateLayout.dart';

class MobileAppDrawer extends StatelessWidget {
  const MobileAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MobileTemplateLayout(
                              child: MobileViewGenericProductList(
                                  isRequireBanner: true),
                            )));
              }),
          createDrawerBodyItem(
              icon: Icons.car_rental,
              text: 'Car Accessories',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MobileTemplateLayout(
                            child: MobileViewGenericProductList())));
              }),
          createDrawerBodyItem(
              icon: Icons.car_rental,
              text: 'Fashion',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MobileTemplateLayout(
                            child: MobileViewGenericProductList())));
              }),
          createDrawerBodyItem(
              icon: Icons.car_rental,
              text: 'Accessories',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MobileTemplateLayout(
                            child: MobileViewGenericProductList())));
              }),

          Divider(),
          createDrawerBodyItem(
              icon: Icons.account_circle, text: 'Profile', onTap: () {}),
          createDrawerBodyItem(
              icon: Icons.account_circle, text: 'Orders', onTap: () {}),
          createDrawerBodyItem(
              icon: Icons.contact_phone, text: 'Contact Info', onTap: () {}),
          createDrawerBodyItem(
              icon: Icons.account_circle, text: 'Privacy Policy', onTap: () {}),
          // ListTile(
          //   title: Text('App version 1.0.0'),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bg_header.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Welcome to Flutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}
