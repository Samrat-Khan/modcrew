import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_page/const_and_theme/colors.dart';
import 'package:shopping_page/screens/account_settings/model/orderOnWayModel.dart';
import 'package:shopping_page/widgets/loading_no_data/loading.dart';
import 'package:shopping_page/widgets/util/symbol.dart';

class OrderHistoryCard extends StatelessWidget {
  final Future<dynamic> future;
  const OrderHistoryCard({
    Key? key,
    required this.size,
    required this.future,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.6,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Order History",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Divider(
              color: Color(dividerColor),
            ),
            SizedBox(height: 5),
            FutureBuilder(
              future: future,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingSpiner();
                }
                if (snapshot.hasData) {
                  return Container(
                    width: size.width * 0.35,
                    height: size.height * 0.52,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        OrderStatusModel model =
                            OrderStatusModel.fromJson(snapshot.data[i]);
                        DateTime? dateTime =
                            DateTime.tryParse(model.orderDate.toString());

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width / 4,
                            height: 180,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${dateTime!.day}-${dateTime.month}-${dateTime.year}",
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "Sub Total: $rupee ${model.subTotal}",
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color(dividerColor),
                                ),
                                Container(
                                  height: 120,
                                  width: size.width,
                                  decoration: BoxDecoration(),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.orderItems.length,
                                    itemBuilder: (context, i) {
                                      var order = model.orderItems[i];
                                      return Card(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Container(
                                          width: size.width * 0.2,
                                          height: size.height,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 90,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        order.image),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                width: 160,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      order.name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.ubuntu(),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Total Units: ${order.units} pics',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.ubuntu(),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Total Price($rupee): ${order.sellingPrice * order.units}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.ubuntu(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else
                  return Center(
                    child: Text(
                      "You have not placed any order",
                      style: GoogleFonts.ubuntu(),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
