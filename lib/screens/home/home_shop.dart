import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class ShopScreen extends StatefulWidget {
  final int pageIndex;
  const ShopScreen({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.pageIndex);
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
                  text: "Fashion",
                ),
                Tab(
                  text: "Collectibles",
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
                FashionCategory(),
                CollectibleCategory(),
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
