import 'package:flutter/material.dart';

// class Todos extends StatelessWidget {
//   final todos = <Todo>[];

//   Todos(int index) {
//     for (var i = 0; i < index; i++) {
//       todos.add(Todo(text: 'Todo n°$i'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
//       children: todos,
//     );
//   }
// }

class Todo extends StatelessWidget {
  Todo({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
