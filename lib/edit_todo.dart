import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final int number;

  Test({this.number});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EditTodo extends StatefulWidget {
  EditTodo({this.text});

  final String text;

  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = false;

  void _handleIsEmpty() {
    setState(() {
      _isEmpty = _controller.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text;
    _controller.addListener(_handleIsEmpty);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit todo'),
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: _isEmpty
            ? null
            : () {
                Navigator.pop(context, _controller.text);
              },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: _isEmpty
              ? null
              : BoxDecoration(
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
        maxLength: null,
        maxLines: null,
        controller: _controller,
      ),
    );
  }
}
