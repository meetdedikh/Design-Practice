import 'package:demoproject/model/comment_model.dart';

class InstagramPost {
  final String username;
  final String userProfileImage;
  final String postImage;
  final String caption;
  final int likes;
  final int comments;
  final String timestamp;

  InstagramPost({
    required this.username,
    required this.userProfileImage,
    required this.postImage,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });
}

class Post {
  final int id;
  final String title;
  final String body;
  bool isLiked;
  List<Comment> comments;

  Post(
      {required this.id,
      required this.title,
      required this.body,
      this.isLiked = false,
      this.comments = const []});

  // Add a method to add a comment to the post
  void addComment(Comment comment) {
    comments.add(comment);
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
