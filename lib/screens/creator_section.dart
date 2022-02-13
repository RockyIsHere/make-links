import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:make_links/controller/auth_controller.dart';
import 'package:make_links/widgets/button.dart';
import '../constants/colors.dart';

class CreatorSection extends StatefulWidget {
  const CreatorSection({Key? key}) : super(key: key);

  @override
  State<CreatorSection> createState() => _CreatorSectionState();
}

class _CreatorSectionState extends State<CreatorSection> {
  final TextEditingController name = TextEditingController();
  final TextEditingController publisher = TextEditingController();
  final TextEditingController storyType = TextEditingController();
  final TextEditingController story = TextEditingController();
  final TextEditingController height = TextEditingController();

  File? imageFile;
  String? imageUrl;
  String? imageName;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kFont),
                          borderRadius: BorderRadius.circular(10)),
                      height: 130,
                      width: 130,
                      child: imageFile != null
                          ? Image.file(imageFile!)
                          : const Icon(
                              Icons.collections,
                              size: 35,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              _pickImage(context, ImageSource.gallery);
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.file_upload),
                            ),
                          ),
                          Text(
                            imageName?.substring(12) ?? 'Upload image',
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CreatorText(
                            controller: height,
                            name: 'Approximate image height',
                            validator: (value) {
                              if (value == null) {
                                return 'This field should not be empty';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CreatorText(
              name: 'Story name',
              controller: name,
              height: 70,
              maxLine: 3,
              validator: (value) {
                if (value == null) {
                  return 'This field should not be empty';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CreatorText(
              name: 'Publisher',
              controller: publisher,
              validator: (value) {
                if (value == null) {
                  return 'This field should not be empty';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CreatorText(
              name: 'Type',
              controller: storyType,
              validator: (value) {
                if (value == null) {
                  return 'This field should not be empty';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: CreatorText(
              name: 'Story',
              controller: story,
              height: 350,
              maxLine: 1000,
              validator: (value) {
                if (value == null) {
                  return 'This field should not be empty';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Button(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (FirebaseAuth.instance.currentUser == null) {
                        Get.bottomSheet(
                          const PhoneVerificationWindow(),
                          backgroundColor: Colors.white,
                        );
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        _uploadImage();
                      }
                    }
                  },
                  color: Colors.deepOrangeAccent,
                  name: !isLoading ? 'Upload' : 'Loading...',
                  backgroundColor: Colors.white,
                  isTrue: !isLoading,
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Button(
                    onTap: () {},
                    color: Colors.deepOrangeAccent,
                    name: 'Submit',
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _pickImage(BuildContext context, ImageSource source) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        setState(() {
          imageFile = File(image.path);
          imageName = image.name;
        });
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print('Failed to pickup image : $e');
    }
  }

  _uploadImage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('Choti poster')
        .child('$imageName.jpg');
    await ref.putFile(imageFile!).then((p0) {
      setState(() {
        isLoading = false;
      });
    });
    imageUrl = await ref.getDownloadURL();
  }
}

class CreatorText extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final double height;
  final int maxLine;
  final String? Function(String?)? validator;
  const CreatorText({
    Key? key,
    required this.controller,
    required this.name,
    this.height = 50,
    this.maxLine = 1,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.deepOrangeAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextFormField(
          validator: validator,
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
    );
  }
}

class PhoneVerificationWindow extends StatefulWidget {
  const PhoneVerificationWindow({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationWindow> createState() =>
      _PhoneVerificationWindowState();
}

class _PhoneVerificationWindowState extends State<PhoneVerificationWindow> {
  final TextEditingController phone = TextEditingController();
  final AuthController authController = Get.find();

  final _formKey = GlobalKey<FormState>();
  var isPhoneEntered = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Before uploading please sign into this app',
                style: TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Please Login using your phone',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.deepOrangeAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 10) {
                        setState(() {
                          isPhoneEntered = true;
                        });
                      } else {
                        setState(() {
                          isPhoneEntered = false;
                        });
                      }
                    },
                    validator: ((value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Please enter your 10 digit phone number';
                      }
                      return null;
                    }),
                    controller: phone,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(phone.text);
                    authController.verifyPhone(phone.text);
                    Get.back();
                    Get.bottomSheet(const OtpVerification(),
                        backgroundColor: Colors.white);
                  }
                },
                color: isPhoneEntered ? Colors.white : Colors.deepOrangeAccent,
                name: 'Send OTP',
                backgroundColor:
                    isPhoneEntered ? Colors.deepOrangeAccent : Colors.white,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController otp = TextEditingController();
  final TextEditingController name = TextEditingController();
  final AuthController authController = Get.find();

  final _formKey = GlobalKey<FormState>();
  var isPhoneEntered = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter otp and your name',
                style: TextStyle(
                  color: kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CreatorText(controller: name, name: 'Name'),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.deepOrangeAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 6) {
                        setState(() {
                          isPhoneEntered = true;
                        });
                      } else {
                        setState(() {
                          isPhoneEntered = false;
                        });
                      }
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty || value.length != 6) {
                        return 'Please enter your 6 digit otp';
                      }
                      return null;
                    }),
                    controller: otp,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter OTP Here',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authController.verifyCode(otp.text);
                  }
                },
                color: isPhoneEntered ? Colors.white : Colors.deepOrangeAccent,
                name: 'Submit OTP',
                backgroundColor:
                    isPhoneEntered ? Colors.deepOrangeAccent : Colors.white,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
