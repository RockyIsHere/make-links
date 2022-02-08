// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/model/book.dart';

class BookCover extends StatelessWidget {
  final Book? book;
  const BookCover({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.only(left: 20),
      height: 250,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: Hero(
                tag: 'rocky',
                child: Image.network(
                  book!.imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 280,
            bottom: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange,
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 335,
            bottom: 2,
            child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kFont,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.save_alt_rounded,
                      color: Colors.deepOrange,
                      size: 35,
                    ),
                    Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
