import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repositories_app/models/repository.dart';
import 'package:github_repositories_app/pages/detailspage.dart';

enum ViewType { list, grid }

class RepositoryList extends StatelessWidget {
  final List<Repository> repositories;
  final ViewType viewType;
  final VoidCallback onToggleViewType;

  RepositoryList({
    required this.repositories,
    required this.viewType,
    required this.onToggleViewType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Repositories',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Card(
              child: IconButton(
                onPressed: onToggleViewType,
                icon: viewType == ViewType.list
                    ? Icon(Icons.grid_view)
                    : Icon(Icons.list),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        if (viewType == ViewType.list)
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              final repository = repositories[index];
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.green, width: 1)),
                child: ListTile(
                  title: Text(repository.name),
                  onTap: () {
                    Get.to(() => RepositoryDetailsPage(repository: repository));
                  },
                ),
              );
            },
          )
        else
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              final repository = repositories[index];
              return InkWell(
                onTap: () {
                  Get.to(() => RepositoryDetailsPage(repository: repository));
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.green, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(repository.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
