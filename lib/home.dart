import 'package:flutter/material.dart';

import 'todos.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodosApp'),
        elevation: 8,
      ),
      body: Todos(),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 36,
        ),
      ),
    );
  }
}
