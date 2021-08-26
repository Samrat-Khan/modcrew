import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shopping_page/screens/screens.dart';

class PopupReviewProduct extends StatefulWidget {
  final String productId;
  PopupReviewProduct({Key? key, required this.productId}) : super(key: key);

  @override
  _PopupReviewProductState createState() => _PopupReviewProductState();
}

class _PopupReviewProductState extends State<PopupReviewProduct> {
  final ReviewHTTPService reviewHTTPService = ReviewHTTPService();

  final authController = AuthController.to;

  String reviewTitle = '';

  postReview({required RatingDialogResponse response}) async {
    if (response.rating >= 1 && response.rating <= 2) {
      setState(() {
        reviewTitle = "Not Good Product";
      });
    } else if (response.rating > 2 && response.rating < 4) {
      setState(() {
        reviewTitle = "Average Product";
      });
    } else if (response.rating > 4 && response.rating <= 5) {
      setState(() {
        reviewTitle = "Very Nice Product";
      });
    }

    await reviewHTTPService.postProductReview(
      userId: authController.userData.value[0].id,
      review: response.comment,
      rating: response.rating,
      title: reviewTitle,
      reviwerName: authController.userData.value[0].firstName +
          " " +
          authController.userData.value[0].lastName,
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: "Add Review",
      submitButton: "Submit",
      onSubmitted: (response) {
        postReview(response: response);
      },
    );
  }
}
