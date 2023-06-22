import 'package:flutter/material.dart';
import 'package:github_repositories_app/models/repository.dart';
import 'package:intl/intl.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final Repository repository;

  RepositoryDetailsPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Repository Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${repository.name}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8.0),
            Text('Description: ${repository.description}'),
            SizedBox(height: 8.0),
            Text('Stars: ${repository.stars}'),
            SizedBox(height: 8.0),
            Text('Forks: ${repository.forks}'),
            SizedBox(height: 8.0),
            Text('Language: ${repository.language}'),
            SizedBox(height: 8.0),
            Text(
                'Created At: ${getFormattedDate(DateTime.parse(repository.createdAt), ' dd MMMM, yyyy')}'),
          ],
        ),
      ),
    );
  }
}

String getFormattedDate(DateTime dateTime, String format) {
  return DateFormat(format).format(dateTime);
}
