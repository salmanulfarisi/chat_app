import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Contacts'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text("User Name"),
          subtitle: Text("Last Message"),
          trailing: Text("Time"),
        ),
      ),
    );
  }
}
