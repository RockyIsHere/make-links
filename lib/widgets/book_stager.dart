import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:make_links/controller/book_controller.dart';
import 'package:make_links/widgets/bookitem.dart';

import '../screens/category_screen.dart';

class BookStragerGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  const BookStragerGridView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.find();
    final bookList = bookController.books;
    // final bookList = books;
    return PageView(
      controller: pageController,
      onPageChanged: (index) => callback(index),
      children: [
        StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            itemCount: bookList.length,
            itemBuilder: (_, index) => BookItem(
                  book: bookList[index],
                ),
            staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
        const Category(),
      ],
    );
  }
}
