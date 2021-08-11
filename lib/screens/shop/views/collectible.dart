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
    //if only main category Selected
    if (selectedProduct.isNotEmpty && byPrice.isEmpty) {
      Map<String, dynamic> data = await httpService.getProductesByCategory(
          mainCategory: selectedProduct);
      return (data["data"]);
    }
    //if only price selcted
    if (byPrice.isNotEmpty && selectedProduct.isEmpty) {
      Map<String, dynamic> data = await httpService.getProductsByPrice(
          byPrice: byPrice, productType: "collectibles");
      return (data["data"]);
    }

    //if both selected
    if (byPrice.isNotEmpty && selectedProduct.isNotEmpty) {
      Map<String, dynamic> data =
          await httpService.getProductesByCategoryAndPrice(
              mainCategory: selectedProduct, byPrice: byPrice);

      return (data["data"]);
    }

    //if nothing selected
    if (byPrice.isEmpty && selectedProduct.isEmpty) {
      Map<String, dynamic> data =
          await httpService.getProductByType(productType: "collectibles");
      return (data["data"]);
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
              //only seleted chip T/F
              selectedCollectibleCategory[0] = !selectedCollectibleCategory[0];
              //making rest of Chip false
              selectedCollectibleCategory[1] = selectedCollectibleCategory[2] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
              //setting val of selectedProduct
              selectedCollectibleCategory[0]
                  ? selectedProduct = collectibleCategory[0].toLowerCase()
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[1],
          selected: selectedCollectibleCategory[1],
          function: (val) {
            setState(() {
              //only seleted chip T/F
              selectedCollectibleCategory[1] = !selectedCollectibleCategory[1];
              //making rest of Chip false
              selectedCollectibleCategory[0] = selectedCollectibleCategory[2] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
              //setting val of selectedProduct
              selectedCollectibleCategory[1]
                  ? selectedProduct = collectibleCategory[1].toLowerCase()
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[2],
          selected: selectedCollectibleCategory[2],
          function: (val) {
            setState(() {
              //only seleted chip T/F
              selectedCollectibleCategory[2] = !selectedCollectibleCategory[2];
              //making rest of Chip false
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[3] =
                      selectedCollectibleCategory[4] = false;
              //setting val of selectedProduct
              selectedCollectibleCategory[2]
                  ? selectedProduct = collectibleCategory[2].toLowerCase()
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[3],
          selected: selectedCollectibleCategory[3],
          function: (val) {
            setState(() {
              //only seleted chip T/F
              selectedCollectibleCategory[3] = !selectedCollectibleCategory[3];
              //making rest of Chip false
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[2] =
                      selectedCollectibleCategory[4] = false;
              //setting val of selectedProduct
              selectedCollectibleCategory[3]
                  ? selectedProduct = collectibleCategory[3].toLowerCase()
                  : selectedProduct = '';
            });
          },
        ),
        categoryChip(
          label: collectibleCategory[4],
          selected: selectedCollectibleCategory[4],
          function: (val) {
            setState(() {
              //only seleted chip T/F
              selectedCollectibleCategory[4] = !selectedCollectibleCategory[4];
              //making rest of Chip false
              selectedCollectibleCategory[0] = selectedCollectibleCategory[1] =
                  selectedCollectibleCategory[2] =
                      selectedCollectibleCategory[3] = false;
              //setting val of selectedProduct
              selectedCollectibleCategory[4]
                  ? selectedProduct = collectibleCategory[4].toLowerCase()
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
