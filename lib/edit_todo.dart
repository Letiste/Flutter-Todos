import 'package:flutter/material.dart';

class EditTodo extends StatefulWidget {
  EditTodo({required this.text});

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
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            color: Color.fromRGBO(245, 245, 245, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) =>
                        Navigator.pop(context, _controller.text),
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      hintText: 'To do :',
                    ),
                    cursorColor: Colors.deepPurple[800],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.deepPurple[800],
                      ),
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _isEmpty
                          ? null
                          : () {
                              Navigator.pop(context, _controller.text);
                            },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[800],
                      ),
                      child: Text(
                        'EDIT',
                        style: TextStyle(fontSize: 18, letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
