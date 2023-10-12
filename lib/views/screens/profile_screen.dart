import 'package:demoproject/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('100'),
                      Text('Post'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('100'),
                      Text('Following'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('100'),
                      Text('Follower'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, World!',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black38)),
                      SizedBox(height: 5),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Web Developer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your code to handle the 'Edit Profile' button press here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.white,
                          elevation: 3, // Button elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your code to handle the 'Follow' button press here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          disabledBackgroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Follow',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 400,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Tagged Posts'),
                        ],
                        indicatorColor: Colors.blueGrey,
                        labelColor: Color.fromARGB(255, 248, 0, 0),
                        unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            buildPostsTab(),
                            buildTaggedPostsTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel),
              label: const Text('Cancel'),
            ),
            TextButton.icon(
              onPressed: () {
                _logout(context);
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}

Widget buildPostsTab() {
  return Scaffold(
    body: Column(
      children: [
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 11,
            itemBuilder: (context, index) {
              return Image.network(
                'https://picsum.photos/200/300',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildTaggedPostsTab() {
  return const Scaffold(
    body: Center(
      child: Text('Tagged Posts Content Goes Here'),
    ),
  );
}
