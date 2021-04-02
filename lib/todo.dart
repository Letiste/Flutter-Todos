import 'package:flutter/material.dart';

import 'edit_todo.dart';

class Todo extends StatefulWidget {
  Todo({this.text, this.index, this.deleteTodo});

  final String text;
  final int index;
  final void Function(BuildContext, int) deleteTodo;

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
      onDismissed: (_) => widget.deleteTodo(context, widget.index),
      child: Container(
        height: 90,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 1.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.purple[800],
                icon: Icon(Icons.edit),
                onPressed: () {
                  editTodo(context, textTodo);
                },
              ),
              Expanded(
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  value: false,
                  onChanged: (_) => widget.deleteTodo(context, widget.index),
                  title: Text(
                    textTodo,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
