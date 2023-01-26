import 'package:flutter/material.dart';

class TryWidget extends StatelessWidget {
  const TryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Try'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}
