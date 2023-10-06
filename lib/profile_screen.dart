import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text(
          "Profile Screen",
          style: TextStyle(
              fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                // Following Count
                Column(
                  children: [
                    Text('100'),
                    Text('Following'),
                  ],
                ),
                SizedBox(width: 10), // Add some spacing between elements
                // Follower Count
                Column(
                  children: [
                    Text('100'),
                    Text('Follower'),
                  ],
                ), // Replace '1000' with your actual follower count
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
                        style: TextStyle(fontSize: 14, color: Colors.black38)),
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
                        backgroundColor: Colors.blue, // Button background color
                        disabledBackgroundColor: Colors.white, // Text color
                        elevation: 3, // Button elevation
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Button border radius
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          // Center the text horizontally
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
                        primary: Colors.green, // Button background color
                        onPrimary: Colors.white, // Text color
                        elevation: 3, // Button elevation
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Button border radius
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Follow',
                          textAlign:
                              TextAlign.center, // Center the text horizontally
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1, // 1-pixel space between rows
                  crossAxisSpacing: 1, // 1-pixel space between columns
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  // Replace this with your image widget
                  return Image.network(
                    'https://picsum.photos/200/300',
                    fit: BoxFit.cover, // Adjust as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}