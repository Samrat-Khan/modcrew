import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class FashionCategory extends StatefulWidget {
  const FashionCategory({Key? key}) : super(key: key);

  @override
  _FashionCategoryState createState() => _FashionCategoryState();
}

class _FashionCategoryState extends State<FashionCategory> {
  GetAllProductsHTTPService httpService = GetAllProductsHTTPService();
  final List<String> categoryList = [
    "Active Wear",
    "Top Wear",
    "Bottom Wear",
    "Accessories"
  ];
  final List<String> activeWear = ["Jogger", "Jersey"];
  final List<bool> selectedActiveWear = [false, false];
  final List<String> topWear = ["Henly", "Round Neck", "Crop Top"];
  final List<bool> selectedTopWear = [false, false, false];
  final List<String> bottomWear = ["Shorts"];
  final List<bool> selectedBottomWear = [false];
  final List<String> accessoried = ["Cap", "Bandana", "Bag"];
  final List<bool> selectedAccessoried = [false, false, false];
  bool priceLowToHigh = false, priceHighToLow = false;
  final List<bool> selectedCategory = [false, false, false, false];
  @override
  void initState() {
    super.initState();
  }

  getProductData() async {
    Map<String, dynamic> data = await httpService.getAllProduct();
    return data["data"];
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
          label: categoryList[0],
          selected: selectedCategory[0],
          function: (val) {
            setState(() {
              selectedCategory[0] = !selectedCategory[0];
              selectedCategory[1] =
                  selectedCategory[2] = selectedCategory[3] = false;
            });
          },
        ),
        categoryChip(
          label: categoryList[1],
          selected: selectedCategory[1],
          function: (val) {
            setState(() {
              selectedCategory[1] = !selectedCategory[1];
              selectedCategory[0] =
                  selectedCategory[2] = selectedCategory[3] = false;
            });
          },
        ),
        categoryChip(
          label: categoryList[2],
          selected: selectedCategory[2],
          function: (val) {
            setState(() {
              selectedCategory[2] = !selectedCategory[2];
              selectedCategory[0] =
                  selectedCategory[1] = selectedCategory[3] = false;
            });
          },
        ),
        categoryChip(
          label: categoryList[3],
          selected: selectedCategory[3],
          function: (val) {
            setState(() {
              selectedCategory[3] = !selectedCategory[3];
              selectedCategory[0] =
                  selectedCategory[1] = selectedCategory[2] = false;
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
