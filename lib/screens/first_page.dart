import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:make_links/controller/auth_controller.dart';
import 'package:make_links/controller/book_controller.dart';
import 'package:make_links/controller/global_controller.dart';
import 'package:make_links/widgets/homepage.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final BookController bookController = Get.put(BookController());
  final GlobalController globalController = Get.put(GlobalController());
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              Get.to(() => const HomePage());
            },
            icon: const Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}
