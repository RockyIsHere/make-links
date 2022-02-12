import 'package:flutter/material.dart';

const BoxDecoration kDecoration =
    BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [
  BoxShadow(
    color: Colors.grey,
    offset: Offset(4, 4),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4, -4),
    blurRadius: 15,
    spreadRadius: 1,
  )
]);
BoxDecoration kDecoration1 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1,
      )
    ]);
