import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class CollectibleCategory extends StatefulWidget {
  const CollectibleCategory({Key? key}) : super(key: key);

  @override
  _CollectibleCategoryState createState() => _CollectibleCategoryState();
}

class _CollectibleCategoryState extends State<CollectibleCategory> {
  HTTPService httpService = HTTPService();
  bool _isLowerWear = false;
  @override
  void initState() {
    super.initState();
  }

  getCollectibleProducts() async {
    Map<String, dynamic> data =
        await httpService.getSelectedProductes(qString: "collectible");
    return (data["data"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Customtheme.lightTheme.scaffoldBackgroundColor,
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Price Low to High",
                color: Colors.green,
                isAvaterNeed: true,
                avater: Icons.arrow_downward,
                isSelected: _isLowerWear,
                action: (value) {
                  // setState(() {
                  //   byPrice = priceLowToHigh = value;
                  //   priceHighToLow = false; //= _isLowerWear
                  // });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Price High to Low",
                color: Colors.green,
                isAvaterNeed: true,
                avater: Icons.arrow_upward,
                isSelected: _isLowerWear,
                action: (value) {
                  // setState(() {
                  //   byPrice = priceHighToLow = value;
                  //   priceLowToHigh = false; //= _isLowerWear
                  // });
                },
              ),
              SizedBox(width: 10),
            ],
          ),
          preferredSize: Size.fromHeight(10),
        ),
      ),
      body: ProductFutureBuilder(future: getCollectibleProducts()),
    );
  }
}
