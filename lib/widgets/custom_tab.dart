import 'package:flutter/material.dart';
import 'package:make_links/constants/colors.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;
  CustomTab(this.selected, this.callback, {Key? key}) : super(key: key);
  final tabs = ['Latest', 'Genre'];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      width: width,
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => callback(index),
          child: Container(
            decoration: BoxDecoration(
              color: selected == index ? Colors.white : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            alignment: Alignment.center,
            width: (width - 40) / 2 - 10,
            child: Text(
              tabs[index],
              style: const TextStyle(color: kFont, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: tabs.length,
      ),
    );
  }
}
