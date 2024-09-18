import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_user_data/controller/user_controller.dart';
import 'package:get_user_data/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: Center(
          child: GetX<UserController>(
              init: UserController(),
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      User user = controller.users[index];
                      return ListTile(
                        title: Text(user.id.toString()),
                        subtitle: Text('${user.name}\n${user.email}'),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
