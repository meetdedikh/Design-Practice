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

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
