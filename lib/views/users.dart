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
    return StreamBuilder(
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
              if (monUtilisateur.id == otherUser.id) {
                return Container();
              } else {
                return Card(
                  elevation: 5,
                  color: Colors.purple,
                  child: ListTile(
                    onTap: () {
                      //ouvrir une nouvller page de chat
                      print("message");
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(otherUser.profileImageUrl!),
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
    );
  }
}
