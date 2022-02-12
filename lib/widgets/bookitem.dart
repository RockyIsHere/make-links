import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_links/constants/decoration.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: kDecoration1,
        height: book.height as double,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: book.imgUrl!,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
