import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String username;
  String email;
  String profileImageUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profileImageUrl
  });

  // Convertir un User en map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }
}

// Enregistrer un nouvel utilisateur dans la collection "users" de Firestore
Future<void> registerUser(String id, String username, String email, String profileImageUrl) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User user = User(id: id, username: username, email: email, profileImageUrl: profileImageUrl);
  await users.doc(id).set(user.toMap());
}
