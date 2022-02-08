import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:make_links/model/user.dart';

class UserController extends GetxController {
  final usersRef =
      FirebaseFirestore.instance.collection('user').withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromSnapshot(snapshot),
            toFirestore: (user, _) => user.toJson(),
          );

  var users = <User>[].obs;

  Future<void> getUsers({int lastN = 7}) async {
    var querySnapshot = await usersRef.get();
    var usersList = querySnapshot.docs
        .map(
          (doc) => doc.data(),
        )
        .toList();
    users.clear();
    users.addAll(usersList);
    print('rocky');
    print(users[0]);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getUsers();
    super.onInit();
  }
}
