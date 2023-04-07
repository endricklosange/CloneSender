import 'package:flutter/material.dart';
import 'package:clone_sender/models/message.dart';
import 'package:clone_sender/models/user.dart';
import 'package:clone_sender/views/chat.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});
  @override
  State<MessagePage> createState() => _MessagesState();
}

class _MessagesState extends State<MessagePage> {
  List users = [User.empty()];
  List message = [];
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //       onTap: () => FocusScope.of(context).unfocus(),
  //       child: Column(
  //         children: [
  //           // create a list of users
  //           Expanded(
  //             child: Container(
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(30.0),
  //                   topRight: Radius.circular(30.0),
  //                 ),
  //               ),
  //               child: ClipRRect(
  //                 borderRadius: const BorderRadius.only(
  //                   topLeft: Radius.circular(30.0),
  //                   topRight: Radius.circular(30.0),
  //                 ),
  //                 child: ListView.builder(
  //                   padding: const EdgeInsets.only(top: 15.0),
  //                   itemCount: users.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final User user = users[index];
  //                     final Message message = Message(senderId: "1", receiverId: "1", content: "content", timestamp: DateTime.now(), unread: true);
  //                     return GestureDetector(
  //                       onTap: () => Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (_) => Chat(
  //                             user: user,
  //                           ),
  //                         ),
  //                       ),
  //                       child: Container(
  //                         margin: const EdgeInsets.only(
  //                           top: 5.0,
  //                           bottom: 5.0,
  //                           right: 20.0,
  //                         ),
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 20.0,
  //                           vertical: 10.0,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: message.unread
  //                               ? const Color(0xFFFFEFEE)
  //                               : Colors.white,
  //                           borderRadius: const BorderRadius.only(
  //                             topRight: Radius.circular(20.0),
  //                             bottomRight: Radius.circular(20.0),
  //                           ),
  //                         ),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 CircleAvatar(
  //                                   radius: 35.0,
  //                                   backgroundImage: AssetImage(user.profileImageUrl),
  //                                 ),
  //                                 const SizedBox(width: 10.0),
  //                                 Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Text(
  //                                       user.username,
  //                                       style: const TextStyle(
  //                                         color: Colors.grey,
  //                                         fontSize: 15.0,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     const SizedBox(height: 5.0),
  //                                     Container(
  //                                       width:
  //                                           MediaQuery.of(context).size.width *
  //                                               0.45,
  //                                       child: Text(
  //                                         message.content,
  //                                         style: const TextStyle(
  //                                           color: Colors.blueGrey,
  //                                           fontSize: 15.0,
  //                                           fontWeight: FontWeight.w600,
  //                                         ),
  //                                         overflow: TextOverflow.ellipsis,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                             Column(
  //                               children: [
  //                                 Text(
  //                                   message.timestamp.toString(),
  //                                   style: const TextStyle(
  //                                     color: Colors.grey,
  //                                     fontSize: 15.0,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 const SizedBox(height: 5.0),
  //                                 if (message.unread)
  //                                   Container(
  //                                     width: 40.0,
  //                                     height: 20.0,
  //                                     decoration: const BoxDecoration(
  //                                       borderRadius: BorderRadius.all(
  //                                         Radius.circular(30.0),
  //                                       ),
  //                                     ),
  //                                     alignment: Alignment.center,
  //                                     child: const Text(
  //                                       'NEW',
  //                                       style: TextStyle(
  //                                         color: Colors.white,
  //                                         fontSize: 12.0,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                   ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //   );
  // }

  // get users
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Messages'),
    );
  }
}