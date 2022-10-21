import 'package:chat_app/modules/contacts/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactView extends GetView<ContactsController> {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Contacts'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.allUser.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(controller.allUser[index].pic!),
                ),
                title: Text('${controller.allUser[index].name}'),
                subtitle: Text("${controller.allUser[index].email}"),
              );
            },
          );
        }
      }),
    );
  }
}
