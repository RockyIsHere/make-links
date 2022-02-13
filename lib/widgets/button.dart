import 'dart:isolate';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final Color color;
  final Color backgroundColor;
  final String name;
  final double width;
  final bool isTrue;
  const Button({
    Key? key,
    required this.onTap,
    required this.color,
    required this.name,
    required this.backgroundColor,
    this.width = 140,
    this.isTrue = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: color,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: () => onTap(),
          child: Center(
            child: isTrue
                ? Text(
                    name,
                    style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
          ),
        ));
  }
}
