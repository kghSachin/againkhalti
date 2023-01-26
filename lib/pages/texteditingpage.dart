import 'package:flutter/material.dart';

class TextEditingExample extends StatefulWidget {
  const TextEditingExample({super.key});

  @override
  State<TextEditingExample> createState() => _TextEditingExampleState();
}

class _TextEditingExampleState extends State<TextEditingExample> {
  late final TextEditingController _controller;
  late final TextEditingController _passController;
  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.electric_meter_rounded,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Text Editing Controller Example",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.chat_rounded,
            ),
            onPressed: () {
              debugPrint("Chat");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _passController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(_controller.text);
              print(_passController.text);
            },
            child: const Text("Login"),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(_controller.text),
          // StreamBuilder(
          //   stream: _controller.text,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     return Container(
          //       child: Text(snapshot.data),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
