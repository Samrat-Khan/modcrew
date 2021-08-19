import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shopping_page/screens/screens.dart';
import 'package:shopping_page/widgets/widgets.dart';

class PopupReviewProduct extends StatelessWidget {
  final String productId;
  PopupReviewProduct({Key? key, required this.productId}) : super(key: key);
  final ReviewHTTPService reviewHTTPService = ReviewHTTPService();
  final authController = AuthController.to;
  postReview({required RatingDialogResponse response}) async {
    await reviewHTTPService.postProductReview(
      userId: authController.userData.value[0].id,
      review: response.comment,
      rating: response.rating,
      reviwerName: authController.userData.value[0].firstName +
          " " +
          authController.userData.value[0].lastName,
      token: authController.authToken.value,
      productId: productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: "Add Review",
      submitButton: "Submit",
      onSubmitted: (response) {
        print("Response Comment ${response.comment}");
        print("Response Rating ${response.rating}");

        postReview(response: response);
      },
    );
  }
}
