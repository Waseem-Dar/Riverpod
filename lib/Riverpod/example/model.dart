class Posts{
  final int userId;
  final int it;
  final String title;
  final String body;

  const Posts({
    required this.userId,
    required this.it,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'it': it,
      'title': title,
      'body': body,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      userId: map['userId'] as int,
      it: map['it'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }


}