import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

Future confirmMessage({
  required BuildContext context,
  required String message,
  required Color ringColor,
  required CountDownController countDownController,
  required int duration,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 7,
        backgroundColor: Colors.white,
        title: CircularCountDownTimer(
          duration: duration,
          initialDuration: 0,
          controller: countDownController,
          width: 50,
          height: 50,
          ringColor: ringColor,
          ringGradient: null,
          fillColor: Colors.white,
          fillGradient: null,
          backgroundColor: Colors.white,
          backgroundGradient: null,
          strokeWidth: 5.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            print('Countdown Started');
          },
          onComplete: () {
            Navigator.of(context).pop();
          },
        ),
        content: Text(message),
      );
    },
  );
}
