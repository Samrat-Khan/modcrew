import 'package:flutter/material.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/widgets/widgets.dart';

import '../../screens.dart';

class CollectibleCategory extends StatefulWidget {
  const CollectibleCategory({Key? key}) : super(key: key);

  @override
  _CollectibleCategoryState createState() => _CollectibleCategoryState();
}

class _CollectibleCategoryState extends State<CollectibleCategory> {
  GetProductsHTTPService httpService = GetProductsHTTPService();
  final List<String> collectibleCategory = [
    "Diary",
    "Sticker",
    "Badge",
    "Key-Chain",
    "Poster"
  ];
  final List<bool> selectedCollectibleCategory = [
    false,
    false,
    false,
    false,
    false
  ];
  bool priceLowToHigh = false, priceHighToLow = false;
  String selectedProduct = '';
  String byPrice = '';
  @override
  void initState() {
    super.initState();
  }

  getCollectibleProducts() async {
    Map<String, dynamic> data =
        await httpService.getAllProduct(productType: "collectibles");
    return (data["data"]);
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
                SizedBox(height: 15),
                filterByPrice(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ProductFutureBuilder(
                future: getCollectibleProducts(),
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
          label: collectibleCategory[0],
          selected: selectedCollectibleCategory[0],
          function: (val) {
            setState(() {
              selectedCollectibleCategory[0] = !selectedCollectibleCategory[0];
              selectedCollectibleCategory[1] = selectedCollectibleCategory[2] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[1],
          selected: selectedCollectibleCategory[1],
          function: (val) {
            setState(() {
              selectedCollectibleCategory[1] = !selectedCollectibleCategory[1];
              selectedCollectibleCategory[0] = selectedCollectibleCategory[2] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
              selectedCollectibleCategory[1]
                  ? selectedProduct = ''
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[2],
          selected: selectedCollectibleCategory[2],
          function: (val) {
            setState(() {
              selectedCollectibleCategory[2] = !selectedCollectibleCategory[2];
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
              selectedCollectibleCategory[2]
                  ? selectedProduct = ''
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[3],
          selected: selectedCollectibleCategory[3],
          function: (val) {
            setState(() {
              selectedCollectibleCategory[3] = !selectedCollectibleCategory[3];
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[2] =
                      selectedCollectibleCategory[4] = false;
              selectedCollectibleCategory[3]
                  ? selectedProduct = ''
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[4],
          selected: selectedCollectibleCategory[4],
          function: (val) {
            setState(() {
              selectedCollectibleCategory[4] = !selectedCollectibleCategory[4];
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[2] =
                      selectedCollectibleCategory[3] = false;
              selectedCollectibleCategory[4]
                  ? selectedProduct = ''
                  : selectedProduct = '';
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
              priceHighToLow ? byPrice = "price" : byPrice = '';
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
              priceLowToHigh ? byPrice = "-price" : byPrice = '';
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
