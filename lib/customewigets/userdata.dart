import 'package:flutter/material.dart';
import 'package:github_repositories_app/models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  UserInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        SizedBox(height: 16.0),
        Text(user.login,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        Text(user.bio),
        SizedBox(height: 16.0),
      ],
    );
  }
}
