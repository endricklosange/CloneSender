import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clone_sender/models/message.dart';

class FirestoreHelper {
  final auth = FirebaseAuth.instance;
  CollectionReference cloudUsers = FirebaseFirestore.instance.collection('users');
  CollectionReference cloudMessages = FirebaseFirestore.instance.collection('messages');

  Future<void> registerUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logoutUser() async {
    await auth.signOut();
  }

  User?getCurrentUser() {
    return auth.currentUser;
  }

  Future<QuerySnapshot> getUsers() async {
    return await cloudUsers.get();
  }

  Future<DocumentSnapshot> getUserById(String id) async {
    return await cloudUsers.doc(id).get();
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await cloudUsers.where('email', isEqualTo: email).get();
  }

  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    await cloudUsers.doc(id).update(data);
  }

  Future<void> deleteUser(String id) async {
    await cloudUsers.doc(id).delete();
  }

  Future<void> sendMessage(String senderId, String receiverId, String content) async {
    DateTime timestamp = DateTime.now();
    Message message = Message(
        senderId: senderId, receiverId: receiverId, content: content, timestamp: timestamp, unread: true);
    await cloudMessages.add(message.toMap());
  }

  Future<void> updateMessage(String id, Map<String, dynamic> data) async {
    await cloudMessages.doc(id).update(data);
  }

  Future<void> deleteMessage(String id) async {
    await cloudMessages.doc(id).delete();
  }

  Future<QuerySnapshot> getMessages(String senderId, String receiverId) async {
    return await cloudMessages
        .where('senderId', isEqualTo: senderId)
        .where('receiverId', isEqualTo: receiverId)
        .get();
  }
}