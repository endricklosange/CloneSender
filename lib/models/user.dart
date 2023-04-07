import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
  late String username;
  late String email;
  late String profileImageUrl;

  User(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data()as Map<String,dynamic>;
    username = map['USERNAME'];
    email = map['EMAIL'];
    profileImageUrl = map["AVATAR"] ?? "defaultImage";
    Timestamp? timeprovisoire = map["BIRTHDAY"];
  }

  User.empty(){
    id = "";
    username ="";
    email ="";
    profileImageUrl ="";
  }
}