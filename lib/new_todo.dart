import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final TextEditingController _controller = TextEditingController();
  String todo = '';
  bool _isEmpty = true;

  void _handleIsEmpty() {
    setState(() {
      _isEmpty = _controller.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
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
                    cursorColor: Colors.purple[800],
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
                        primary: Colors.purple[800],
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
                        primary: Colors.purple[800],
                      ),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                            fontSize: 18,
                            // color: Colors.purple[800],
                            letterSpacing: 0.5),
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
