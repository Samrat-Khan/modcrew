import 'package:colorize/colorize.dart';
import 'package:flutter/material.dart';
import 'package:shopping_page/models/productModel.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/callProducts.dart';
import 'package:shopping_page/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Colorize colorString = new Colorize();
  HTTPService httpService = HTTPService();
  @override
  void initState() {
    super.initState();
  }

  getProductData() async {
    Map<String, dynamic> data =
        await httpService.getProductsData(endPoint: "products");

    return (data["data"]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutTemplate(
      body: homeBody(size: size, context: context),
    );
  }

  ListView homeBody({required Size size, required BuildContext context}) {
    var isDesktop = Responsive.isDesktop(context);
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.39,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/banner.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 15),
        FutureBuilder(
          future: getProductData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingSpiner(),
              );
            }
            if (!snapshot.hasData || snapshot.hasError) {
              return Center(
                child: NoData(noDataType: "productData"),
              );
            }
            if (snapshot.hasData) {
              return SnapshotGridBuilder(
                isDesktop: isDesktop,
                snapshot: snapshot,
              );
            }
            return Center(
              child: LoadingSpiner(),
            );
          },
        ),
        SizedBox(height: 30),
        isDesktop ? DividerMessage() : SizedBox(),
        SizedBox(height: 30),
        Footer(),
      ],
    );
  }
}
