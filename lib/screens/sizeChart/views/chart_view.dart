import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_table/json_table.dart';
import 'package:shopping_page/screens/sizeChart/model/chart_model.dart';
import '../../screens.dart';

class SizeChart extends StatelessWidget {
  SizeChart({Key? key}) : super(key: key);
  final String menSizeImage =
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/files/sizeguide_man.jpg?3124";
  final String womenSizeImage =
      "https://cdn.shopify.com/s/files/1/0266/6276/4597/files/sizeguide_woman.jpg?3084";

  @override
  Widget build(BuildContext context) {
    return NewTemplate(
      sliverChild: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              runSpacing: 20,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    SelectableText(
                      "Size Chart for Mens(inch)",
                      style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TableForSizeChart(
                      jsonTableData: sizeChartForMen,
                    ),
                  ],
                ),
                SizedBox(width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    SelectableText(
                      "Size Chart for Womens(inch)",
                      style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TableForSizeChart(
                      jsonTableData: sizeChartForWomen,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            SelectableText(
              "How to Measure",
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Wrap(
              children: [
                imageContainer(imageUrl: menSizeImage, context: context),
                imageContainer(imageUrl: womenSizeImage, context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  imageContainer({
    required String imageUrl,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.3,
              child: Center(
                child: Image.network(imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableForSizeChart extends StatelessWidget {
  final List<Map<String, dynamic>> jsonTableData;
  const TableForSizeChart({
    Key? key,
    required this.jsonTableData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JsonTable(
      jsonTableData,
      tableHeaderBuilder: (String? header) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5), color: Colors.grey[300]),
          child: Text(
            header!,
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.w900),
          ),
        );
      },
      tableCellBuilder: (value) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 0.5, color: Colors.grey.withOpacity(0.5))),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
