import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String username;
  String email;
  String profileImageUrl;

  User({this.id, this.username, this.email, this.profileImageUrl});

  // Convertir un User en map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Créer une instance de User à partir d'un DocumentSnapshot Firestore
  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return User(
      id: data['id'],
      username: data['username'],
      email: data['email'],
      profileImageUrl: data['profileImageUrl'],
    );
  }
}

// Enregistrer un nouvel utilisateur dans la collection "users" de Firestore
Future<void> registerUser(String id, String username, String email, String profileImageUrl) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User user = User(id: id, username: username, email: email, profileImageUrl: profileImageUrl);
  await users.doc(id).set(user.toMap());
}
