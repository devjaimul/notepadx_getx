import 'package:flutter/material.dart';

class HeadingTwo extends StatelessWidget {
  final String data;
  final double? fontSize;
  final Color? color;

  const HeadingTwo({
    super.key,
    required this.data,
    this.fontSize, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight:FontWeight.w600,
        color:color?? Colors.black,
      ),
    );
  }
}

class HeadingThree extends StatelessWidget {
  final String data;
  final double? fontSize;

  const HeadingThree({
    super.key,
    required this.data,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        //fontWeight:FontWeight.w400,
        color: Colors.black.withOpacity(0.5),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

