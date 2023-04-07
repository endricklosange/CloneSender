import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clone_sender/controllers/firestore_helper.dart';
import 'package:clone_sender/models/user.dart';
import 'package:clone_sender/global.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersState();
}

class _UsersState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible (
      child: StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().cloudUsers.snapshots(),
        builder: (context, snapshot) {
          List document = snapshot.data?.docs ?? [];
          if(document.isEmpty) {
            return const Center(
              child: CircularProgressIndicator.adaptive()
            );
          } else {
            return ListView.builder(
              itemCount: document.length,
              itemBuilder: (context, index) {
                User otherUser = User(document[index]);
                if (monUtilisateur.id != otherUser.id) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        print(otherUser.id);
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                      ),
                      title: Text(otherUser.username),
                      subtitle: Text(otherUser.email),
                    ),
                  );
                }
              }
            );
          }
        }
      )
    );
    
  }
}
