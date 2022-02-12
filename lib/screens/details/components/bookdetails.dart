import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/model/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.type!.toUpperCase(),
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            book.name ?? '',
            style: const TextStyle(
              fontSize: 24,
              color: kFont,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Published from ',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: book.publisher,
                      style: const TextStyle(
                          color: kFont, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                DateFormat.yMMMEd().format(book.date!),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class Story {
//   String? type;
//   String? name;
//   String? publisher;
//   DateTime? date;
//   String? imgUrl;
//   num? score;
//   num? rating;
//   String? review;
//   num? height;

//   Story(
//       {this.type,
//       this.name,
//       this.publisher,
//       this.date,
//       this.imgUrl,
//       this.score,
//       this.rating,
//       this.review,
//       this.height});
// }

// List<Story> storyData = [
//   Story(
//     type: 'history'.toUpperCase(),
//     name: 'Dark world',
//     publisher: 'The INk',
//     date: DateTime(2008, 3, 23),
//     imgUrl: 'assets/images/book7.jpg',
//     score: 893,
//     rating: 4.7,
//     review: 'very good',
//     height: 380.0,
//   ),
//   Story(
//     type: 'history'.toUpperCase(),
//     name: 'Dark world',
//     publisher: 'The INk',
//     date: DateTime(2008, 3, 23),
//     imgUrl: 'assets/images/book7.jpg',
//     score: 893,
//     rating: 4.7,
//     review: 'very good',
//     height: 380.0,
//   ),
// ];
