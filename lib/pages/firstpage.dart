import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repositories_app/models/repository.dart';
import 'package:github_repositories_app/models/user.dart';
import 'package:github_repositories_app/pages/homepage.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          GetBuilder<ThemeController>(
            init: ThemeController(),
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Theme'),
                Switch(
                  inactiveThumbColor: Colors.black,
                  activeColor: Colors.white,
                  value: controller.isDarkMode.value,
                  onChanged: (value) {
                    controller.toggleTheme();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
        title: Text('GitHub Repository App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.5)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                  )),
                  labelText: 'Enter a github username',
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: Icon(Icons.search),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                final String username = _usernameController.text;
                if (username.isNotEmpty) {
                  Get.to(() => HomePage(username: username));
                }
              },
              label: Text('Search'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ThemeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
