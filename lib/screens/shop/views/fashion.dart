import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class FashionCategory extends StatefulWidget {
  const FashionCategory({Key? key}) : super(key: key);

  @override
  _FashionCategoryState createState() => _FashionCategoryState();
}

class _FashionCategoryState extends State<FashionCategory> {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  final List<String> mainCategoryList = [
    "Active Wear",
    "Top Wear",
    "Bottom Wear",
    "Accessories"
  ];
  final List<String> activeWear = ["jogger", "jersey"];
  final List<bool> selectedActiveWear = [false, false];
  final List<String> topWear = ["henly", "round-neck", "crop-top"];
  final List<bool> selectedTopWear = [false, false, false];
  final List<String> bottomWear = ["shorts"];
  final List<bool> selectedBottomWear = [false];
  final List<String> accessoried = ["cap", "bandana", "bag"];
  final List<bool> selectedAccessoried = [false, false, false];
  bool priceLowToHigh = false, priceHighToLow = false;
  final List<bool> selectedCategory = [false, false, false, false];
  String mainSelectItem = '';
  String subSelectItem = '';
  String byPrice = '';
  @override
  void initState() {
    super.initState();
  }

  getProductData() async {
    if (mainSelectItem == '' && subSelectItem == '' && byPrice == '') {
      print("Caling All");
      Map<String, dynamic> data =
          await httpService.getAllProduct(productType: "fashion");
      return data["data"];
    }
    if (mainSelectItem.isNotEmpty) {
      //Checking main.isNotEmpty and Submain.isNotEmpty
      if (mainSelectItem.isNotEmpty &&
          subSelectItem.isNotEmpty &&
          byPrice.isEmpty) {
        print("Caling  main Cat and Sub");
        Map<String, dynamic> data =
            await httpService.getProductsByCategoryAndSubCategory(
                mainCategory: mainSelectItem, subCategory: subSelectItem);
        return data["data"];
      }
      //Checking main.isNotEmpty and price.isNotEmpty

      else if (mainSelectItem.isNotEmpty &&
          byPrice.isNotEmpty &&
          subSelectItem.isEmpty) {
        print("Caling  main Cat and price");
        Map<String, dynamic> data =
            await httpService.getProductesByCategoryAndPrice(
                mainCategory: mainSelectItem, byPrice: byPrice);
        return data["data"];
      }
      //If all there isNotEmpty

      else if (mainSelectItem.isNotEmpty &&
          subSelectItem.isNotEmpty &&
          byPrice.isNotEmpty) {
        print("Caling  main Cat and Sub and Prce");
        Map<String, dynamic> data = await httpService.getProductsByAllFilter(
            productMainCategory: mainSelectItem,
            productSubCategory: subSelectItem,
            byPrice: byPrice);
        return data["data"];
      }
      // checking main.isNotEmpty-- Else case
      else {
        print("Caling Only main Cat");
        Map<String, dynamic> data = await httpService.getProductesByCategory(
            mainCategory: mainSelectItem);
        return data["data"];
      }
    }
    if (byPrice.isNotEmpty && mainSelectItem.isEmpty && subSelectItem.isEmpty) {
      print("Caling Only Price");
      Map<String, dynamic> data = await httpService.getProductsByPrice(
          byPrice: byPrice, productType: "fashion");
      return data["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                filterByCategory(),
                SizedBox(height: 10),
                filterBySubCategory(),
                SizedBox(height: 10),
                filterByPrice(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ProductFutureBuilder(
                future: getProductData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Wrap filterByCategory() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      children: [
        categoryChip(
          label: mainCategoryList[0],
          selected: selectedCategory[0],
          function: (val) {
            setState(() {
              selectedCategory[0] = !selectedCategory[0];
              selectedCategory[0] == true
                  ? mainSelectItem = 'active-wear'
                  : mainSelectItem = '';
              selectedCategory[1] =
                  selectedCategory[2] = selectedCategory[3] = false;
              if (!selectedCategory[0]) {
                subSelectItem = '';
              }
            });
          },
        ),
        categoryChip(
          label: mainCategoryList[1],
          selected: selectedCategory[1],
          function: (val) {
            setState(() {
              selectedCategory[1] = !selectedCategory[1];
              selectedCategory[1] == true
                  ? mainSelectItem = "top-wear"
                  : mainSelectItem = '';
              selectedCategory[0] =
                  selectedCategory[2] = selectedCategory[3] = false;
              if (!selectedCategory[1]) {
                subSelectItem = '';
              }
            });
          },
        ),
        categoryChip(
          label: mainCategoryList[2],
          selected: selectedCategory[2],
          function: (val) {
            setState(() {
              selectedCategory[2] = !selectedCategory[2];
              selectedCategory[2] == true
                  ? mainSelectItem = "bottom-wear"
                  : mainSelectItem = '';
              selectedCategory[0] =
                  selectedCategory[1] = selectedCategory[3] = false;
              if (!selectedCategory[2]) {
                subSelectItem = '';
              }
            });
          },
        ),
        categoryChip(
          label: mainCategoryList[3],
          selected: selectedCategory[3],
          function: (val) {
            setState(() {
              selectedCategory[3] = !selectedCategory[3];
              selectedCategory[3] == true
                  ? mainSelectItem = "accessories"
                  : mainSelectItem = '';
              selectedCategory[0] =
                  selectedCategory[1] = selectedCategory[2] = false;
              if (!selectedCategory[3]) {
                subSelectItem = '';
              }
            });
          },
        ),
      ],
    );
  }

  ChoiceChip categoryChip(
      {required String label,
      required bool selected,
      required Function(bool) function}) {
    return ChoiceChip(
      label: Text(label),
      backgroundColor: Colors.white,
      elevation: 5,
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      selectedColor: Colors.blueAccent,
      selected: selected,
      onSelected: function,
    );
  }

  Wrap filterBySubCategory() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      children: [
        if (selectedCategory[0])
          generateSubCategory(
            lable: activeWear,
            selected: selectedActiveWear,
          ),
        if (selectedCategory[1])
          generateSubCategory(lable: topWear, selected: selectedTopWear),
        if (selectedCategory[2])
          generateSubCategory(lable: bottomWear, selected: selectedBottomWear),
        if (selectedCategory[3])
          generateSubCategory(
              lable: accessoried, selected: selectedAccessoried),
      ],
    );
  }

  Wrap generateSubCategory(
      {required List<String> lable, required List<bool> selected}) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        lable.length,
        (index) => categoryChip(
            label: lable[index],
            selected: selected[index],
            function: (val) {
              setState(() {
                selected[index] = !selected[index];
                selected[index] == true
                    ? subSelectItem = lable[index]
                    : subSelectItem = '';
                for (int i = 0; i < lable.length; i++) {
                  if (index == i) {
                  } else
                    selected[i] = false;
                }
              });
            }),
      ),
    );
  }

  Wrap filterByPrice() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        CustomChipChoice(
          color: Color(primaryColor),
          action: (val) {
            setState(() {
              priceLowToHigh = false;
              priceHighToLow = !priceHighToLow;
              priceHighToLow ? byPrice = "-sellingPrice" : byPrice = '';
            });
          },
          isSelected: priceHighToLow,
          filter: "High to Low",
          isIconAvaterNeed: true,
          iconAvater: Icons.arrow_upward,
        ),
        CustomChipChoice(
          color: Color(primaryColor),
          action: (valu) {
            setState(() {
              priceHighToLow = false;
              priceLowToHigh = !priceLowToHigh;
              priceLowToHigh ? byPrice = "sellingPrice" : byPrice = '';
            });
          },
          isSelected: priceLowToHigh,
          filter: "Low to High",
          isIconAvaterNeed: true,
          iconAvater: Icons.arrow_downward,
        ),
      ],
    );
  }
}
