import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
  late String username;
  late String email;
  late String profileImageUrl;

  User(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data()as Map<String,dynamic>;
    username = map['username'];
    email = map['email'];
    profileImageUrl = map["profileImageUrl"] ?? "defaultImage";
  }

  User.empty(){
    id = "";
    username ="";
    email ="";
    profileImageUrl ="";
  }
}