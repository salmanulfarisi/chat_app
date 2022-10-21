import 'package:chat_app/core/components/filled_outline_button.dart';
import 'package:chat_app/modules/chat_page/view/view.dart';
import 'package:chat_app/modules/home/controller/controller.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeview extends GetView<HomeController> {
  const Homeview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              Get.to(() => const ChatPageView());
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.accents[0],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FillOutlineButton(press: () {}, text: "Recent Message"),
                  // const SizedBox(width: 20),
                  FillOutlineButton(
                    press: () {},
                    text: "Active",
                    isFilled: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.INDIVIDUAL);
                  },
                  title: const Text("User Name"),
                  subtitle: const Text("Last Message"),
                  trailing: const Text("Time"),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CONTACT);
        },
        backgroundColor: Colors.accents[0],
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
