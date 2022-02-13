import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/colors.dart';

// ignore: must_be_immutable
class CreatorSection extends StatefulWidget {
  CreatorSection({Key? key}) : super(key: key);

  @override
  State<CreatorSection> createState() => _CreatorSectionState();
}

class _CreatorSectionState extends State<CreatorSection> {
  final TextEditingController name = TextEditingController();

  final TextEditingController publisher = TextEditingController();

  final TextEditingController storyType = TextEditingController();

  final TextEditingController story = TextEditingController();

  File? imageFile;

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Want to Publish story',
                style: TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'fill below sections',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 130,
          width: 130,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              imageFile != null
                  ? ClipOval(child: Image.file(imageFile!))
                  : const ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
              Positioned(
                right: Get.width * 0.001,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    color: Colors.white,
                    child: const Text('assets/logo/profile.png'),
                    onPressed: () {
                      _pickImage(context, ImageSource.gallery);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CreatorText(
          name: 'Story name',
          controller: name,
          height: 70,
          maxLine: 3,
        ),
        CreatorText(
          name: 'Publisher',
          controller: publisher,
        ),
        CreatorText(
          name: 'Type',
          controller: storyType,
        ),
        CreatorText(
          name: 'Story',
          controller: story,
          height: 350,
          maxLine: 1000,
        ),
      ],
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select Image from',
          ),
          content: SingleChildScrollView(
            child: ListTile(
              leading: const Icon(
                Icons.collections_outlined,
              ),
              title: const Text('Gallary'),
              onTap: () {
                _pickImage(context, ImageSource.gallery);
              },
            ),
          ),
        );
      },
    );
  }

  _pickImage(BuildContext context, ImageSource source) async {
    setState(() {});
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        Navigator.of(context).pop();
        final ref = FirebaseStorage.instance
            .ref()
            .child('Choti poster')
            .child('${image.name}.jpg');

        await ref.putFile(imageFile!);

        imageUrl = await ref.getDownloadURL();
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print('Failed to pickup image : $e');
    }
  }
}

class CreatorText extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final double height;
  final int maxLine;
  const CreatorText({
    Key? key,
    required this.controller,
    required this.name,
    this.height = 50,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.deepOrangeAccent),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            maxLines: maxLine,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: name,
              hintStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
