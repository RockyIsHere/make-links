import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_links/model/book.dart';
import 'package:make_links/screens/details/details.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailPage(book))),
      child: Container(
        height: book.height as double,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(book.imgUrl!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
