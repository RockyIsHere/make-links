// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/constants/decoration.dart';
import 'package:make_links/screens/details/details.dart';

import '../controller/book_controller.dart';
import '../model/book.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.find();

    final bookList = bookController.books;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                    color: kFont,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.8,
                    wordSpacing: 2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: kDecoration,
                  child: const Center(child: Text('here')),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'You may also like',
                style: TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ...List.generate(
                bookList.length,
                (index) {
                  Book book = bookList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailPage(book));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 190,
                        padding: const EdgeInsets.all(8),
                        decoration: kDecoration1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 190,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: book.imgUrl!,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.name ?? '',
                                      style: const TextStyle(
                                        color: kFont,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'By  ',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          ),
                                          TextSpan(
                                            text: book.publisher,
                                            style: const TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    _buildstar(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${book.rating} Rated by our users',
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      book.content!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildstar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.grey.withOpacity(0.3),
    ];
    return Row(
        children: color
            .map((e) => Icon(
                  Icons.star,
                  size: 20,
                  color: e,
                ))
            .toList());
  }
}
