import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/routes/route.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/routes/routeNames.dart';
import 'package:shopping_page/screens/screens.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Get.put(CartController());
  Get.put(AuthController());
  Get.put(VariationController());
  Get.put(OrderIdController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modcrew',
      theme: Customtheme.lightTheme,
      onGenerateRoute: AppRouter.generatedRoute,
      initialRoute: RouteName.home,
      // home: TestWidget(),
    );
  }
}

// class TestWidget extends StatefulWidget {
//   const TestWidget({Key? key}) : super(key: key);

//   @override
//   _TestWidgetState createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<TestWidget> {
//   final TextEditingController addressLineController = TextEditingController();
//   final TextEditingController nearLandMarkController = TextEditingController();
//   final TextEditingController pinCodeController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final List<String> stateList = [
//     "Select",
//     "Andhra Pradesh",
//     "Arunachal Pradesh",
//     "Assam",
//     "Bihar",
//     "Chhattisgarh",
//     "Goa",
//     "Gujarat",
//     "Haryana",
//     "Himachal Pradesh",
//     "Jharkhand",
//     "Karnataka",
//     "Kerala",
//     "Madhya Pradesh",
//     "Maharashtra",
//     "Manipur",
//     "Meghalaya",
//     "Mizoram",
//     "Nagaland",
//     "Odisha",
//     "Punjab",
//     "Rajasthan",
//     "Sikkim",
//     "Tamil Nadu",
//     "Telangana",
//     "Tripura",
//     "Uttar Pradesh",
//     "Uttarakhand",
//     "West Bengal",
//   ];
//   String selectedState = "Select";
//   updateAdress() {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           Size size = MediaQuery.of(context).size;
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             title: Text("Address"),
//             actions: [
//               TextButton(
//                 onPressed: () {},
//                 child: Text("Cancel"),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text("Save"),
//               ),
//             ],
//             content: Container(
//               width: size.width * 0.34,
//               height: 250,
//               child: Column(
//                 children: [
//                   textField(
//                       size: size,
//                       hintText: "Address Line",
//                       controller: addressLineController),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       textField(
//                           size: size,
//                           hintText: "Nearest Landmark",
//                           controller: nearLandMarkController),
//                       textField(
//                           size: size,
//                           hintText: "City",
//                           controller: cityController),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       textField(
//                         size: size,
//                         hintText: "Pincode",
//                         controller: pinCodeController,
//                         isPinCode: true,
//                       ),
//                       DropDownCustom(
//                         onChange: (val) {
//                           setState(() {
//                             selectedState = val as String;
//                           });
//                           print("State is $selectedState");
//                         },
//                       ),
//                       // Container(
//                       //   child: DropdownButton(
//                       //     items: stateList.map<DropdownMenuItem<String>>(
//                       //       (e) {
//                       //         return DropdownMenuItem<String>(
//                       //           child: Text(e),
//                       //           value: e,
//                       //         );
//                       //       },
//                       //     ).toList(),
//                       //     value: selectedState,
//                       //     onChanged: (val) {
//                       //       setState(() {
//                       //         selectedState = val as String;
//                       //       });
//                       //       print(selectedState);
//                       //     },
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                   SizedBox(height: 25),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   Container textField(
//       {required Size size,
//       required String hintText,
//       required TextEditingController controller,
//       bool isPinCode = false}) {
//     return Container(
//       width: size.width * 0.15,
//       height: 70,
//       child: TextField(
//         controller: controller,
//         cursorColor: Colors.black,
//         maxLength: isPinCode ? 6 : null,
//         keyboardType:
//             isPinCode ? TextInputType.number : TextInputType.streetAddress,
//         inputFormatters: [
//           isPinCode
//               ? FilteringTextInputFormatter.digitsOnly
//               : FilteringTextInputFormatter.singleLineFormatter,
//         ],
//         decoration: InputDecoration(
//           hintText: hintText,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 5),
//           filled: true,
//           fillColor: Color(textFieldBg),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: updateAdress,
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         child: Center(
//           child: Text("Test Widget"),
//         ),
//       ),
//     );
//   }
// }

// class DropDownCustom extends StatefulWidget {
//   final Function(Object?) onChange;
//   const DropDownCustom({Key? key, required this.onChange}) : super(key: key);

//   @override
//   _DropDownCustomState createState() => _DropDownCustomState();
// }

// class _DropDownCustomState extends State<DropDownCustom> {
//   final List<String> stateList = [
//     "Select",
//     "Andhra Pradesh",
//     "Arunachal Pradesh",
//     "Assam",
//     "Bihar",
//     "Chhattisgarh",
//     "Goa",
//     "Gujarat",
//     "Haryana",
//     "Himachal Pradesh",
//     "Jharkhand",
//     "Karnataka",
//     "Kerala",
//     "Madhya Pradesh",
//     "Maharashtra",
//     "Manipur",
//     "Meghalaya",
//     "Mizoram",
//     "Nagaland",
//     "Odisha",
//     "Punjab",
//     "Rajasthan",
//     "Sikkim",
//     "Tamil Nadu",
//     "Telangana",
//     "Tripura",
//     "Uttar Pradesh",
//     "Uttarakhand",
//     "West Bengal",
//   ];
//   String selectedState = "Select";
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       items: stateList.map<DropdownMenuItem<String>>(
//         (e) {
//           return DropdownMenuItem<String>(
//             child: Text(e),
//             value: e,
//           );
//         },
//       ).toList(),
//       value: selectedState,
//       onChanged: (val) {
//         widget.onChange(val);
//         setState(() {
//           selectedState =val as String;
//         });
//       },
//     );
//   }
// }
