import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderId;
  String receiverId;
  String content;
  DateTime timestamp;
  bool unread;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    required this.unread,
  });

  // Convertir un Message en map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timestamp': timestamp,
      'unread': unread,
    };
  }
}

// Enregistrer un message dans la collection "messages" de Firestore
Future<void> sendMessage(String senderId, String receiverId, String content) async {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  DateTime timestamp = DateTime.now();
  Message message = Message(
      senderId: senderId, receiverId: receiverId, content: content, timestamp: timestamp, unread: true);
  await messages.add(message.toMap());
}
