import 'package:flutter/material.dart';
import 'package:shopping_page/controller/authController.dart';
import 'package:shopping_page/controller/cartController.dart';
import 'package:shopping_page/routes/data/appBarArgsModel.dart';
import 'package:shopping_page/screens/home/home.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class DefaultAppBar extends StatefulWidget {
  // final bool isNeedBottomTab;
  // final Widget body;
  // final int index;
  final AppBarArgsModel appBarArgsModel;
  DefaultAppBar({
    Key? key,
    // this.isNeedBottomTab = true,
    // this.body = const SizedBox(),
    // this.index = 0,
    required this.appBarArgsModel,
  }) : super(key: key);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar>
    with SingleTickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();

  int initIndex = 0;

  final cartController = CartController.to;

  final authController = AuthController.to;
  TabController? _tabController;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  chnageIndex(int index) {
    setState(() {
      initIndex = widget.appBarArgsModel.index;
    });
  }

  bool checkRouteName(String routeName) {
    if (ModalRoute.of(context)!.settings.name == routeName) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: SearchBar(controller: _controller),
          ),
          leadingWidth: size.width * 0.2,
          centerTitle: false,
          title: ModCrewLogo(),
          bottom: widget.appBarArgsModel.isNeedBottomTab
              ? PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(),
                )
              : PreferredSize(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Shop",
                      ),
                      Tab(
                        text: "About Us",
                      ),
                      Tab(
                        text: "Contact Us",
                      ),
                    ],
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
        ),
        body: widget.appBarArgsModel.isNeedBottomTab
            ? TabBarView(
                controller: _tabController,
                children: [
                  Home(),
                  Shop(),
                  AboutUs(),
                  ContactUs(),
                ],
              )
            : widget.appBarArgsModel.body,
      ),
    );
  }
}
