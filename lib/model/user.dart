import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  List<String>? masseges;
  User({this.name, this.masseges});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final user = User.fromJson(snapshot.data() as Map<String, dynamic>);
    return user;
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
