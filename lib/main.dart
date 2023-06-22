import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:github_repositories_app/pages/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub API Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: FirstPage(),
    );
  }
}
