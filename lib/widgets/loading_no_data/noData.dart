import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  NoData({Key? key, required this.noDataType}) : super(key: key);
  final String noDataType;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          ImageIcon(
            AssetImage(noDataType == "review"
                ? "assets/images/review.png"
                : "assets/images/no-data.png"),
            size: 25,
          ),
          SizedBox(height: 15),
          Text(noDataType == "review" ? "No Review Yet" : "No Data Found"),
        ],
      ),
    );
  }
}
