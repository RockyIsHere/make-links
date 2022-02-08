import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:make_links/controller/book_controller.dart';
import 'package:make_links/controller/user_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var users = userController.users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildLinks'),
      ),
      body: ListView(
        children: [
          ...List.generate(
              users.length,
              (index) => UserCard(
                    name: 'rocky',
                  )),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  const UserCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('assets/images/chat-2389223.png'),
              radius: 35),
          SizedBox(
            width: 12,
          ),
          Column(
            children: [Text(name)],
          )
        ],
      ),
    );
  }
}
