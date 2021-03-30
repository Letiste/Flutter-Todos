import 'package:flutter/material.dart';

import 'new_todo.dart';
import 'todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  void _addTodo() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewTodo()),
    );
    setState(() {
      todos.add(Todo(text: result));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodosApp'),
        elevation: 8,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
        children: todos,
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(
          Icons.add,
          size: 36,
        ),
      ),
    );
  }
}
