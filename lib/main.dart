import 'package:demoproject/views/screens/add_post_screen.dart';
import 'package:demoproject/views/screens/home_screen.dart';
import 'package:demoproject/views/screens/message_screen.dart';
import 'package:demoproject/views/screens/post_feed_screen.dart';
import 'package:demoproject/views/screens/profile_screen.dart';
import 'package:demoproject/views/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const BottomNavigationDemo(),
    );
  }
}

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    PostFeedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ClipOval(
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ClipOval(
              child: Icon(Icons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ClipOval(
              child: Icon(Icons.add),
            ),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: ClipOval(
              child: Icon(Icons.message),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: ClipOval(
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        type:
            BottomNavigationBarType.fixed, // Fixed type to prevent moving icons
        selectedItemColor: Colors.black, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        showUnselectedLabels: true, // Show labels for unselected items
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
