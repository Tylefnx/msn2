import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  const AppText({super.key, required this.text, this.textStyle});

  factory AppText.normal({required String text}) {
    return AppText(
      text: text,
      textStyle: const TextStyle(),
    );
  }

  factory AppText.bold({required String text}) {
    return AppText(
      text: text,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory AppText.bigBold({required String text}) {
    return AppText(
      text: text,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  factory AppText.littleBigBoldold({required String text}) {
    return AppText(
      text: text,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  factory AppText.veryBigBold({required String text}) {
    return AppText(
      text: text,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 48,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
