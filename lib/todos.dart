import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
      itemBuilder: (context, index) => Todo(index: index),
      itemCount: 20,
    );
  }
}

class Todo extends StatelessWidget {
  Todo({this.index});

  final int index;

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
                'Todo n°$index',
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
