class User {
  final String login;
  final String avatarUrl;
  final String bio;

  User({this.login = '', this.avatarUrl = '', this.bio = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      bio: json['bio'] ?? '',
    );
  }
}
