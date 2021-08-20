import 'package:flutter/material.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _email = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        child: DismissKeyboard(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: Column(
                      children: [
                        container(
                          child: CustomTextField(
                            size: size,
                            hintText: "Your Name",
                            controller: _name,
                            valiadtor: (val) {},
                          ),
                          size: size,
                        ),
                        container(
                          child: CustomTextField(
                            size: size,
                            hintText: "Your Email",
                            controller: _email,
                            valiadtor: (val) {},
                          ),
                          size: size,
                        ),
                        container(
                          child: CustomTextField(
                            size: size,
                            hintText: "Your Messgae",
                            needMultiline: true,
                            controller: _message,
                            valiadtor: (val) {},
                          ),
                          size: size,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.18,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Send"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container container({required Widget child, required Size size}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.2,
      child: child,
    );
  }
}
