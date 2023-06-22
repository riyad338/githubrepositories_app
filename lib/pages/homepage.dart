import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repositories_app/customewigets/repositorielist.dart';
import 'package:github_repositories_app/customewigets/userdata.dart';
import 'package:github_repositories_app/getx/homecontroller.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: GetX<HomeController>(
            init: HomeController(username: widget.username),
            builder: (controller) {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.hasError.value) {
                return Center(
                    child: Text('Error occurred while fetching data'));
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      UserInfo(user: controller.user.value),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: controller.filterController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.5)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.green,
                            )),
                            labelStyle: TextStyle(color: Colors.green),
                            labelText: 'Filter by Name ',
                            suffixIcon: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.filter_list),
                                    onPressed: () {
                                      controller.filterRepositories(
                                        controller.filterController.text,
                                      );
                                      setState(() {});
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      controller.filterController.clear();

                                      setState(() {
                                        controller.filterRepositories(
                                          controller.filterController.text,
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      RepositoryList(
                        repositories: controller.filteredRepositories,
                        viewType: controller.viewType.value,
                        onToggleViewType: controller.toggleViewType,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
