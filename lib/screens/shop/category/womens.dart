import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class WomensCategory extends StatefulWidget {
  const WomensCategory({Key? key}) : super(key: key);

  @override
  _WomensCategoryState createState() => _WomensCategoryState();
}

class _WomensCategoryState extends State<WomensCategory> {
  HTTPService httpService = HTTPService();
  bool _isLowerWear = false, priceHighToLow = false, priceLowToHigh = false;
  bool isLoading = false, byPrice = false;
  @override
  void initState() {
    super.initState();
  }

  getWomenProducts() async {
    Map<String, dynamic> dataByFilter = _isLowerWear
        ? await httpService.getSelectedProductFromFilter(
            qString: "women", filter: "lower")
        : await httpService.getSelectedProductes(qString: "women");
    Map<String, dynamic> dataByPrice = priceHighToLow
        ? await httpService.getSelectedProductFromPrcie(
            highToLow: false, productMainCategory: "women", filter: "lower")
        : await httpService.getSelectedProductFromPrcie(
            highToLow: true, productMainCategory: "women", filter: "lower");
    return byPrice ? dataByPrice["data"] : (dataByFilter["data"]);
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
              CustomChipChoice(
                filter: "Lower Wear",
                color: Colors.green,
                isAvaterNeed: false,
                isSelected: _isLowerWear,
                action: (value) {
                  setState(() {
                    _isLowerWear = value;
                    priceHighToLow = priceLowToHigh = byPrice = false;
                  });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Price Low to High",
                color: Colors.green,
                isAvaterNeed: true,
                avater: Icons.arrow_downward,
                isSelected: priceLowToHigh,
                action: (value) {
                  setState(() {
                    byPrice = priceLowToHigh = value;
                    priceHighToLow = false; //= _isLowerWear
                  });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Price High to Low",
                color: Colors.green,
                isAvaterNeed: true,
                avater: Icons.arrow_upward,
                isSelected: priceHighToLow,
                action: (value) {
                  setState(() {
                    byPrice = priceHighToLow = value;
                    priceLowToHigh = false; //= _isLowerWear
                  });
                },
              ),
              SizedBox(width: 10),
            ],
          ),
          preferredSize: Size.fromHeight(10),
        ),
      ),
      body: ProductFutureBuilder(future: getWomenProducts()),
    );
  }
}
