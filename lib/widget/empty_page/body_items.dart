import 'package:flutter/material.dart';


class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    super.key,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(245, 124, 0, 1)));
  }
}
