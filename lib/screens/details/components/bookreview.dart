import 'package:flutter/material.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/model/book.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${book.score}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              _buildstar(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${book.rating} Rated by our users',
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: book.content,
                  style: const TextStyle(
                    color: kFont,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                  size: 25,
                  color: e,
                ))
            .toList());
  }
}
