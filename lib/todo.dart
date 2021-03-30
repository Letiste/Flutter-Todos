import 'package:flutter/material.dart';

import 'edit_todo.dart';

class Todo extends StatefulWidget {
  Todo({this.text, this.index, this.deleteTodo});

  final String text;
  final int index;
  final void Function(int) deleteTodo;

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String textTodo;

  void editTodo(BuildContext context, String text) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => EditTodo(text: text)),
    );
    setState(() {
      print(textTodo);
      textTodo = result;
      print(textTodo);
    });
  }

  @override
  void initState() {
    super.initState();
    print('initstate');
    textTodo = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                textTodo,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            IconButton(
              color: Colors.purple[800],
              icon: Icon(Icons.edit),
              onPressed: () {
                editTodo(context, textTodo);
              },
            ),
            IconButton(
              color: Colors.purple[800],
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.deleteTodo(widget.index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
