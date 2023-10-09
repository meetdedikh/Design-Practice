import 'package:demoproject/model/post_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<InstagramPost> posts = [
    InstagramPost(
      username: 'meet_ag',
      timestamp: '2 minute ago',
      userProfileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2-l19pnO5YYm5CJ4kRTuKPOckcbLI0JdG8g&usqp=CAU',
      postImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhnzivrpJFSc4ngnW6Dccrwyx0yVqId0Xslw&usqp=CAU',
      caption: 'This is a sample caption for post 1.',
      likes: 123,
      comments: 45,
    ),
    InstagramPost(
      username: 'dhrumil_22',
      timestamp: '1 hours ago',
      userProfileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYSCym3IZC-m8o8SUO_TDGr5RbrTrBpeShoA&usqp=CAU',
      postImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1lR8Biy-cOh-8pNeVrT_s6LwSa7Cx_xlgxg&usqp=CAU',
      caption: 'Another sample caption for post 2.',
      likes: 456,
      comments: 78,
    ),
    InstagramPost(
      username: 'anil_01',
      timestamp: '30 min ago',
      userProfileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL6x9MfYNWeItVatVSX3vB7zFB60b5YE0Gxw&usqp=CAU',
      postImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOldtr0ZTuNEsnoyI3qeecWCHmF1YF-J3zsw&usqp=CAU',
      caption: 'Another sample caption for post 2.',
      likes: 456,
      comments: 78,
    ),
    InstagramPost(
      username: 'patel_03',
      timestamp: '1 day ago',
      userProfileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6dM5TPc_IGyOoIHCKjqQH_1-SRSXHzuSs_Q&usqp=CAU',
      postImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR7F3IpclXPk-INFWrxy163L_2MIBRV5PCnA&usqp=CAU',
      caption: 'Another sample caption for post 2.',
      likes: 456,
      comments: 78,
    ),
    InstagramPost(
      username: 'sharma_03',
      timestamp: '2 hours ago',
      userProfileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDKzcekGQw2gBJ4Mwo5ceB0XhUzMX1ydsgBg&usqp=CAU',
      postImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdM9z-HIdq4IMWkuCv2t4rpVlF0iQ2WoYmjw&usqp=CAU',
      caption: 'Another sample caption for post 2.',
      likes: 456,
      comments: 78,
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feed'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.userProfileImage),
                ),
                title: Text(post.username),
                subtitle: Text(post.timestamp), // You can add a timestamp here
              ),
              Image.network(
                post.postImage,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(post.caption),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border),
                        const SizedBox(width: 4),
                        Text('${post.likes} Likes'),
                        const SizedBox(width: 16),
                        const Icon(Icons.mode_comment_outlined),
                        const SizedBox(width: 4),
                        Text('${post.comments} Comments'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
