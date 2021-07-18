import 'package:flutter/material.dart';
import 'package:shopping_page/dummyData/dummyData.dart';
import 'package:shopping_page/widgets/widgets.dart';

class MobileTemplateLayout extends StatelessWidget {
  final Widget child;
  const MobileTemplateLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MobileAppDrawer(),
      appBar: AppBar(
        title: ModCrewLogo(),
      ),
      body: child,
    );
  }
}

class MobileViewGenericProductList extends StatelessWidget {
  final bool isRequireBanner;
  const MobileViewGenericProductList({
    Key? key,
    this.isRequireBanner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          isRequireBanner
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/car3.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          // GridView.builder(
          //   physics: ScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: carData.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          //     childAspectRatio: (2 / 3),
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: ProductCard(data: carData[index]),
          //     );
          //   },
          // ),
          Footer(),
        ],
      ),
    );
  }
}
