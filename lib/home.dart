import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_todo.dart';
import 'todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Todo> _todos = <String, Todo>{};
  // SplayTreeMap<String, Todo> _todos = SplayTreeMap();

  void _addTodo() async {
    var result = await Navigator.push(
      context,
      DialogRoute(
        barrierColor: Color.fromRGBO(50, 50, 50, 0.3),
        barrierDismissible: true,
        context: context,
        builder: (context) => NewTodo(),
      ),
    );
    if (result != null && result.toString().isNotEmpty) {
      var key = DateTime.now().toString();
      setState(() {
        _todos[key] =
            Todo(text: result, keyString: key, deleteTodo: _deleteTodo);
      });
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, result.toString());
    }
  }

  void _deleteTodo(BuildContext context, String keyString) {
    setState(() {
      _todos.remove(keyString);
    });

    SharedPreferences.getInstance().then((prefs) => prefs.remove(keyString));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Todo deleted',
          style: TextStyle(color: Colors.deepPurple[800]),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1500),
        elevation: 4,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      var keys = prefs.getKeys();
      setState(() {
        keys.forEach((key) {
          _todos[key] = Todo(
              text: prefs.getString(key),
              keyString: key,
              deleteTodo: _deleteTodo);
        });
      });
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
                Colors.deepPurple[500],
                Colors.deepPurple[800],
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              SizedBox(height: 100),
              ..._todos.values.toList(),
              SizedBox(height: 25)
            ],
            // padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
            // itemBuilder: (_, index) => _todos.entries.elementAt(index).value,
            // itemCount: _todos.length,
          ),
        ),
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
                Colors.deepPurple[500],
                Colors.deepPurple[800],
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
