import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/dummyData/reviewDummy.dart';
import 'package:shopping_page/models/models.dart';
import 'package:shopping_page/services/services.dart';
import 'package:shopping_page/widgets/widgets.dart';

class CustomerReviewWidgets extends StatefulWidget {
  final List<Review> review;
  CustomerReviewWidgets({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  _CustomerReviewWidgetsState createState() => _CustomerReviewWidgetsState();
}

class _CustomerReviewWidgetsState extends State<CustomerReviewWidgets> {
  final ReviewHTTPService reviewHTTPService = ReviewHTTPService();
  final List<Color> _color = [
    Color(0xff26a440),
    Color(0xffff9f00),
    Color(0xffff6160),
  ];
  @override
  void initState() {
    print(widget.review.length.runtimeType);
    print(widget.review.length);
    super.initState();
  }

  getReviews() async {}
  @override
  Widget build(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: isDesktop
          ? const EdgeInsets.symmetric(horizontal: 50)
          : const EdgeInsets.symmetric(horizontal: 10),
      child: Responsive.isDesktop(context)
          ? SizedBox(
              height: 200,
              child: reviewContentWidget(context),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: reviewContentWidget(context),
            ),
    );
  }

  Widget reviewContentWidget(BuildContext context) {
    var isDesktop = Responsive.isDesktop(context);
    return widget.review.length == 0
        ? NoData(
            noDataType: 'review',
          )
        : GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: isDesktop ? 1 / 2 : 4 / 6,
              crossAxisSpacing: isDesktop ? 20 : 10,
              mainAxisSpacing: isDesktop ? 20 : 5,
            ),
            itemCount: widget.review.length == 0 ? 1 : widget.review.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                reviewData1[index].customerProfilePath),
                          ),
                        ),
                      ),
                      title: Text(
                        "${widget.review[index].reviewerName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${widget.review[index].rating}",
                              style: GoogleFonts.ubuntu(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: widget.review[index].rating <= 2
                                    ? _color[2]
                                    : widget.review[index].rating == 3
                                        ? _color[1]
                                        : _color[0],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Text(
                        "${widget.review[index].body}",
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
