import 'package:flutter/material.dart';
import 'package:clone_sender/views/chat.dart';
import 'package:clone_sender/models/user.dart';
import 'package:clone_sender/views/messages.dart';
import 'package:clone_sender/views/users.dart';
import 'package:clone_sender/views/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone Sender',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Clone Sender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: 
        [
          if (page == 0) const MessagePage(),
          if (page == 1) const UsersPage(),
          if (page == 2) const SettingsPage(),
        ],
      ),

      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: bottomNavigation(),  
    );
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chat(user: User.empty())),
        );
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Users',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: page,
      onTap: (int index) {
        setState(() {
          page = index;
        });
      },
    );
  }
}
