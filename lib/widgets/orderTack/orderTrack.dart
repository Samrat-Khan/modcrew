import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OrderTrack extends StatelessWidget {
  OrderTrack({Key? key}) : super(key: key);
  int i = 0;
  final List<Map> status = [
    {
      "isComplete": true,
      "name": "Order Placed",
      "date": "21-05-2021",
      "trackingNumber": "",
    },
    {
      "isComplete": true,
      "name": "Packing in progress",
      "date": "22-05-2021",
      "trackingNumber": "",
    },
    {
      "isComplete": true,
      "name": "Order hand over to ECOM Express",
      "date": "22-05-2021",
      "trackingNumber": "awb-kkjjlkk",
    },
    {
      "isComplete": false,
      "name": "Order out of delivery",
      "date": "",
      "trackingNumber": "",
    },
    {
      "isComplete": false,
      "name": "Order Deliverd",
      "date": "",
      "trackingNumber": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    status.forEach((element) {
      if (element["isComplete"] == true) {
        i++;
      }
      print("Val of i is $i");
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StepProgressIndicator(
                totalSteps: status.length,
                currentStep: i,
                selectedColor: Colors.red,
                unselectedColor: Colors.yellow,
                direction: Axis.vertical,
              ),
              Container(
                height: 300,
                width: 450,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: status.length,
                  itemBuilder: (_, i) {
                    String tackNumber = status[i]["trackingNumber"] == ""
                        ? ""
                        : status[i]["trackingNumber"];
                    return ListTile(
                      title: Text(status[i]["name"]),
                      subtitle: Text(
                        status[i]["date"],
                      ),
                      trailing: SelectableText("Tracking No. \n $tackNumber"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
