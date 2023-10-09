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
