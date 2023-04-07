import 'package:clone_sender/models/message.dart';
import 'package:clone_sender/models/user.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.user});
  final User user;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : const Color(0xFFFFEFEE),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.timestamp.toString(),
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            message.content,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }
    // return Row(
    //   children: [
    //     msg,
    //     IconButton(
    //       icon: message.isLiked
    //           ? const Icon(Icons.favorite)
    //           : const Icon(Icons.favorite_border),
    //       iconSize: 30.0,
    //       color: message.isLiked
    //           ? Theme.of(context).primaryColor
    //           : const Color(0xFFFFEFEE),
    //       onPressed: () {},
    //     ),
    //   ],
    // );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (String value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.username,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                // child: ClipRRect(
                //   borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(30.0),
                //     topRight: Radius.circular(30.0),
                //   ),
                //   child: ListView.builder(
                //     reverse: true,
                //     padding: const EdgeInsets.only(top: 15.0),
                //     itemCount: messages.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       final Message message = messages[index];
                //       final bool isMe = message.senderId == currentUser.id;
                //       return _buildMessage(message, isMe);
                //     },
                //   ),
                // ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}