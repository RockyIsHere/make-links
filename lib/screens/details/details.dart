import 'package:flutter/material.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/model/book.dart';

import 'components/bookcover.dart';
import 'components/bookdetails.dart';
import 'components/bookreview.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookDetail(
              book: book,
            ),
            BookCover(
              book: book,
            ),
            BookReview(
              book: book,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_outlined),
        color: kFont,
        iconSize: 30,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_outlined),
          color: kFont,
          iconSize: 50,
        )
      ],
    );
  }
}
