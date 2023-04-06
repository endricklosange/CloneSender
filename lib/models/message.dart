import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderId;
  String receiverId;
  String content;
  DateTime timestamp;

  Message({this.senderId, this.receiverId, this.content, this.timestamp});

  // Convertir un Message en map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timestamp': timestamp,
    };
  }

  // Créer une instance de Message à partir d'un DocumentSnapshot Firestore
  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Message(
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      content: data['content'],
      timestamp: data['timestamp'].toDate(),
    );
  }
}

// Enregistrer un message dans la collection "messages" de Firestore
Future<void> sendMessage(String senderId, String receiverId, String content) async {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  DateTime timestamp = DateTime.now();
  Message message = Message(
      senderId: senderId, receiverId: receiverId, content: content, timestamp: timestamp);
  await messages.add(message.toMap());
}
