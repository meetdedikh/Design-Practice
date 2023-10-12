import 'package:demoproject/views/screens/add_post_screen.dart';
import 'package:demoproject/views/screens/home_screen.dart';
import 'package:demoproject/views/screens/login_screen.dart';
import 'package:demoproject/views/screens/post_feed_screen.dart';
import 'package:demoproject/views/screens/profile_screen.dart';
import 'package:demoproject/views/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString('username');
  final password = prefs.getString('password');

  runApp(MyApp(username, password));
}

class MyApp extends StatelessWidget {
  final String? username;
  final String? password;

  MyApp(this.username, this.password);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: (username != null && password != null)
          ? const BottomNavigationDemo()
          : const LoginScreen(),
    );
  }
}

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({Key? key}) : super(key: key);

  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    const PostFeedScreen(),
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
