import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_app/customewigets/repositorielist.dart';
import 'package:github_repositories_app/models/repository.dart';
import 'package:github_repositories_app/models/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final String username;
  final Dio _dio = Dio();
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final Rx<User> user = User().obs;
  final RxList<Repository> repositories = <Repository>[].obs;
  final RxList<Repository> filteredRepositories = <Repository>[].obs;
  final Rx<ViewType> viewType = ViewType.list.obs;
  final TextEditingController filterController = TextEditingController();
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  HomeController({required this.username});

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final userResponse =
          await _dio.get('https://api.github.com/users/$username');
      final userData = userResponse.data;
      user.value = User.fromJson(userData);

      final repoResponse =
          await _dio.get('https://api.github.com/users/$username/repos');
      final repoData = repoResponse.data;
      repositories.value = List<Repository>.from(
          repoData.map((repo) => Repository.fromJson(repo)));
      filteredRepositories.value = repositories.value;

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
    }
  }

  void toggleViewType() {
    viewType.value =
        viewType.value == ViewType.list ? ViewType.grid : ViewType.list;
  }

  void filterRepositories(String filter) {
    if (filter.isEmpty) {
      filteredRepositories.value = repositories.value;
    } else {
      final lowercaseFilter = filter.toLowerCase();
      filteredRepositories.value = repositories.value
          .where((repo) => repo.name.toLowerCase().contains(lowercaseFilter))
          .toList();
    }
  }
}
