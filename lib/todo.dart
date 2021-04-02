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
    if (result.toString().isNotEmpty) {
      setState(() {
        textTodo = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    textTodo = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.index.toString()),
      onDismissed: (_) => widget.deleteTodo(widget.index),
      child: Card(
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
      ),
    );
  }
}
