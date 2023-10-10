import 'dart:convert';
import 'package:demoproject/model/comment_model.dart';
import 'package:demoproject/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostFeedScreenState createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  late Future<List<Post>> posts;
  final TextEditingController commentController = TextEditingController();
  Post? currentPost;

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
      return postList;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void openCommentModal(BuildContext context, Post post) async {
    final commentsResponse = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/comments?postId=${post.id}'),
    );

    if (commentsResponse.statusCode == 200) {
      final List<dynamic> commentsJson = json.decode(commentsResponse.body);
      List<Comment> postComments =
          commentsJson.map((json) => Comment.fromJson(json)).toList();

      setState(() {
        currentPost = post;
        currentPost!.comments = postComments;
        commentController.text = '';
      });

      // ignore: use_build_context_synchronously
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comments (${currentPost!.comments.length})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1.0, color: Colors.grey),
                Expanded(
                  child: ListView.builder(
                    itemCount: currentPost!.comments.length,
                    itemBuilder: (context, index) {
                      final comment = currentPost!.comments[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          // You can use the user's profile picture here
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/600/400',
                          ),
                        ),
                        title: Text(
                          // Display the user's username
                          comment.email,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(comment.body),
                      );
                    },
                  ),
                ),
                const Divider(thickness: 1.0, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          final newComment = Comment(
                            id: currentPost!.comments.length + 1,
                            postId: currentPost!.id,
                            name: 'Your Name',
                            email: 'your@email.com',
                            body: commentController.text,
                          );
                          setState(() {
                            currentPost!.addComment(newComment);
                          });
                          commentController.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // ignore: prefer_const_constructors, use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Failed to load comments for this post.'),
      ));
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
            color: Colors.white,
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
                        backgroundImage:
                            NetworkImage("https://picsum.photos/600/400"),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Text(post.body),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: post.isLiked
                                    ? const Icon(Icons.favorite,
                                        color: Colors.red)
                                    : const Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    post.isLiked = !post.isLiked;
                                  });
                                },
                              ),
                              const SizedBox(width: 8.0),
                              const Text('2.5K'),
                              const SizedBox(width: 16.0),
                              IconButton(
                                icon: const Icon(Icons.chat_bubble_outline),
                                onPressed: () {
                                  openCommentModal(context, post);
                                },
                              ),
                              const SizedBox(width: 8.0),
                              Text('${post.comments.length}'),
                            ],
                          ),
                          const Icon(Icons.bookmark_border),
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
