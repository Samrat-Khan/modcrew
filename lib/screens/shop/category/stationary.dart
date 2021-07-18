import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class StationaryCategory extends StatefulWidget {
  const StationaryCategory({Key? key}) : super(key: key);

  @override
  _StationaryCategoryState createState() => _StationaryCategoryState();
}

class _StationaryCategoryState extends State<StationaryCategory> {
  HTTPService httpService = HTTPService();
  @override
  void initState() {
    super.initState();
  }

  bool _isLowerWear = false;
  getStationaryProducts() async {
    Map<String, dynamic> data =
        await httpService.getSelectedProductes(qString: "stationary");
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
      body: ProductFutureBuilder(future: getStationaryProducts()),
    );
  }
}
