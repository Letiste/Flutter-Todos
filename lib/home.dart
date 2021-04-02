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
    if (result.toString().isNotEmpty) {
      setState(() {
        todos.add(
            Todo(text: result, index: todos.length, deleteTodo: _deleteTodo));
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeWhere((todo) => todo.index == index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodosApp'),
        elevation: 8,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple[500],
                Colors.purple[800],
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
        itemBuilder: (_, index) => todos[index],
        itemCount: todos.length,
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.purple[500],
                Colors.purple[800],
              ],
            ),
          ),
          child: Icon(
            Icons.add,
            size: 36,
          ),
        ),
      ),
    );
  }
}
