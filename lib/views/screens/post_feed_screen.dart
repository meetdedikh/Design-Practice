import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demoproject/model/post_model.dart';
import 'package:flutter/material.dart';

class PostFeedScreen extends StatefulWidget {
  @override
  _PostFeedScreenState createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      List<Post> postList =
          jsonList.map((json) => Post.fromJson(json)).toList();
      print("postList===>>: $postList");
      return postList;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PostFeed',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1253"),
                      ),
                      title: Text(
                        post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        'https://picsum.photos/600/400',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(post.body),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 8.0),
                              Text('2.5K'),
                              SizedBox(width: 16.0),
                              Icon(Icons.chat_bubble_outline),
                              SizedBox(width: 8.0),
                              Text('500'),
                            ],
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
