import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  Todo({this.text, this.index, this.deleteTodo});

  final String text;
  final int index;
  final void Function(int) deleteTodo;

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
                text,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            IconButton(
              color: Colors.purple[800],
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.purple[800],
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteTodo(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
