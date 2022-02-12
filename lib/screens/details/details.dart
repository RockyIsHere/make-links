import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/constants/decoration.dart';
import 'package:make_links/model/book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wants to give Ratting?',
                    style: TextStyle(
                      color: kFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                          SizedBox(
                            height: 320,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                children: [
                                  const Text(
                                    'Please Rate and Review ',
                                    style: TextStyle(
                                      color: kFont,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  RatingBar.builder(
                                    minRating: 1,
                                    itemSize: 40,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            const Icon(
                                      Icons.star,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1.8,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: TextField(
                                          style: TextStyle(fontSize: 18),
                                          maxLines: 8,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Please give us your valuable review',
                                            hintStyle: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 140,
                                    decoration: kDecoration1.copyWith(
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          backgroundColor: Colors.white);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: kDecoration1.copyWith(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Click Here',
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: Colors.deepOrangeAccent,
                          )
                        ],
                      )),
                    ),
                  )
                ],
              ),
            )
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
