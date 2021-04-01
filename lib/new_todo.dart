import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  String todo = '';

  void handleChanged(String text) {
    setState(() {
      todo = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a todo'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, todo);
        },
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
            Icons.check,
            size: 36,
          ),
        ),
      ),
      body: TextField(
        style: TextStyle(
          fontSize: 24,
        ),
        autofocus: true,
        expands: true,
        minLines: null,
        maxLines: null,
        onChanged: handleChanged,
      ),
    );
  }
}
