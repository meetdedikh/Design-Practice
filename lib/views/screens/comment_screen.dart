import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demoproject/model/comment_model.dart';
import 'package:demoproject/model/post_model.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  final Post post;

  CommentScreen({required this.post});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late Future<List<Comment>> comments;

  @override
  void initState() {
    super.initState();
    comments = fetchComments(widget.post.id);
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      List<Comment> commentList =
          jsonList.map((json) => Comment.fromJson(json)).toList();
      return commentList;
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: comments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No comments available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final comment = snapshot.data![index];
                return ListTile(
                  title: Text(comment.name),
                  subtitle: Text(comment.email),
                  contentPadding: EdgeInsets.all(16.0),
                );
              },
            );
          }
        },
      ),
    );
  }
}
