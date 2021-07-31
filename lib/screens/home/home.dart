import 'package:colorize/colorize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/models/productModel.dart';

import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/services/callProducts.dart';
import 'package:shopping_page/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Colorize colorString = new Colorize();
  HTTPService httpService = HTTPService();
  TabController? _tabController;

  getProductData() async {
    Map<String, dynamic> data =
        await httpService.getProductsData(endPoint: "products");

    return (data["data"]);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return NewTemplate(
      sliverChild: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: size.width,
            height: 40,
            color: Color(primaryColor),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w700,
              ),
              isScrollable: Responsive.isDesktop(context) ? false : true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Customtheme.lightTheme.scaffoldBackgroundColor,
              ),
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: "Men",
                ),
                Tab(
                  text: "Women",
                ),
                Tab(
                  text: "Accessories",
                ),
                Tab(
                  text: "Collectible",
                ),
                Tab(
                  text: "Stationary",
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: Colors.amber,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                MensCategory(),
                WomensCategory(),
                AccessoriesCategory(),
                CollectibleCategory(),
                StationaryCategory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//   ListView homeBody({required Size size, required BuildContext context}) {
//     var isDesktop = Responsive.isDesktop(context);
//     return ListView(
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       physics: AlwaysScrollableScrollPhysics(),
//       children: [
//         Container(
//           height: MediaQuery.of(context).size.height * 0.39,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               image: AssetImage("assets/images/banner.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         FutureBuilder(
//           future: getProductData(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: LoadingSpiner(),
//               );
//             }
//             if (!snapshot.hasData || snapshot.hasError) {
//               return Center(
//                 child: NoData(noDataType: "productData"),
//               );
//             }
//             if (snapshot.hasData) {
//               return SnapshotGridBuilder(
//                 isDesktop: isDesktop,
//                 snapshot: snapshot,
//               );
//             }
//             return Center(
//               child: LoadingSpiner(),
//             );
//           },
//         ),
//         SizedBox(height: 30),
//         isDesktop ? DividerMessage() : SizedBox(),
//         SizedBox(height: 30),
//         Footer(),
//       ],
//     );
//   }
// }
