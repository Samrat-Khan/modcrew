import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  TextEditingController _resson = TextEditingController();
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        child: DismissKeyboard(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Container(
                      child: Column(
                        children: [
                          textField(
                              size: size, controller: _name, lableName: "Name"),
                          SizedBox(height: 30),
                          textField(
                              size: size,
                              controller: _email,
                              lableName: "E-mail"),
                          SizedBox(height: 30),
                          textField(
                              size: size,
                              controller: _resson,
                              lableName: "Reason for Contact"),
                          SizedBox(height: 30),
                          textField(
                            size: size,
                            controller: _message,
                            lableName: "Message",
                            needMultiLine: true,
                          ),
                          SizedBox(height: 20),
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

  textField({
    required Size size,
    required TextEditingController controller,
    required String lableName,
    bool needMultiLine = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          lableName,
          style: GoogleFonts.ubuntu(
            fontSize: 16,
          ),
        ),
        Container(
          width: size.width * 0.25,
          height: needMultiLine ? 5 * 24 : 50,
          child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            cursorWidth: 0.2,
            maxLines: !needMultiLine ? 1 : 15,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
