import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/theme.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class MensCategory extends StatefulWidget {
  const MensCategory({Key? key}) : super(key: key);

  @override
  _MensCategoryState createState() => _MensCategoryState();
}

class _MensCategoryState extends State<MensCategory> {
  HTTPService httpService = HTTPService();
  bool _isLowerWear = false,
      _isUpperWear = false,
      _isSemi = false,
      _isCoordinates = false,
      priceHighToLow = false,
      priceLowToHigh = false;
  bool isSubCategory = false;
  bool isLoading = false, byPrice = false;
  String filter = '';
  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> filterByProductType() async {
    return isSubCategory
        ? await httpService.getSelectedProductFromFilter(
            qString: "men", filter: filter)
        : await httpService.getSelectedProductes(qString: "men");
  }

  Future<Map<String, dynamic>> filterByProductPrice() async {
    if (priceHighToLow && _isUpperWear ||
        _isCoordinates ||
        _isLowerWear ||
        _isSemi) {
      return await httpService.getSelectedProductFromPrcie(
          highToLow: false, productMainCategory: "men", filter: "priceHigh");
    } else if (priceLowToHigh && _isUpperWear ||
        _isCoordinates ||
        _isLowerWear ||
        _isSemi) {
      return await httpService.getSelectedProductFromPrcie(
          highToLow: false, productMainCategory: "men", filter: "priceLow");
    } else {
      return await httpService.getSelectedProductFromPrcie(
          highToLow: true, productMainCategory: "men", filter: "price");
    }
  }

  getMenProducts() async {
    if (byPrice) {
      Map<String, dynamic> dataByPrice = await filterByProductPrice();
      return dataByPrice["data"];
    } else {
      Map<String, dynamic> dataByFilter = await filterByProductType();

      return dataByFilter["data"];
    }
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
                filter: "Top Wear",
                color: Colors.green,
                isAvaterNeed: false,
                isSelected: _isUpperWear,
                action: (value) {
                  setState(() {
                    isSubCategory = _isUpperWear = value;
                    _isCoordinates = _isSemi = _isLowerWear = priceHighToLow =
                        priceLowToHigh = byPrice = value ? false : false;
                    filter = "upper";
                  });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Bottom Wear",
                color: Colors.green,
                isAvaterNeed: false,
                isSelected: _isLowerWear,
                action: (value) {
                  setState(() {
                    isSubCategory = _isLowerWear = value;
                    _isCoordinates = _isSemi = _isUpperWear =
                        priceHighToLow = priceLowToHigh = byPrice = false;
                    filter = "lower";
                  });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Coordinates",
                color: Colors.green,
                isAvaterNeed: false,
                isSelected: _isCoordinates,
                action: (value) {
                  setState(() {
                    isSubCategory = _isCoordinates = value;
                    _isUpperWear = _isLowerWear = _isSemi =
                        priceHighToLow = priceLowToHigh = byPrice = false;
                    filter = "coordinates";
                  });
                },
              ),
              SizedBox(width: 10),
              CustomChipChoice(
                filter: "Semi Formal",
                color: Colors.green,
                isAvaterNeed: false,
                isSelected: _isSemi,
                action: (value) {
                  setState(() {
                    isSubCategory = _isSemi = value;
                    _isCoordinates = _isLowerWear = _isUpperWear =
                        priceHighToLow = priceLowToHigh = byPrice = false;
                    filter = "semi";
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
                  print("Price lowToHigh Input $value");
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
      body: ProductFutureBuilder(future: getMenProducts()),
    );
  }
}
