import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_todo.dart';

class Todo extends StatefulWidget {
  Todo({this.text, this.keyString, this.deleteTodo})
      : super(key: Key(keyString));

  final String text;

  final String keyString;

  final void Function(BuildContext, String) deleteTodo;

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> with TickerProviderStateMixin {
  String textTodo;
  AnimationController _controllerOffset;
  AnimationController _controllerSize;
  Animation<Offset> _offsetAnimation;
  Animation<double> _sizeAnimation;
  bool _isVisible = true;

  void _editTodo(BuildContext context, String text) async {
    var result = await Navigator.push(
        context,
        DialogRoute(
          barrierColor: Color.fromRGBO(50, 50, 50, 0.3),
          barrierDismissible: true,
          context: context,
          builder: (context) => EditTodo(
            text: textTodo,
          ),
        ));
    if (result != null && result.toString().isNotEmpty) {
      setState(() {
        textTodo = result;
      });
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(widget.keyString, result.toString());
    }
  }

  void _deleteTodo(BuildContext context, String keyString) {
    setState(() {
      _isVisible = false;
      _controllerSize
          .forward()
          .then((_) => widget.deleteTodo(context, keyString));
    });
  }

  @override
  void initState() {
    super.initState();
    textTodo = widget.text;
    _controllerOffset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controllerOffset, curve: Curves.decelerate),
    );
    _controllerSize = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _sizeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controllerSize,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerOffset.dispose();
    _controllerSize.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: SizeTransition(
        sizeFactor: _sizeAnimation,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Dismissible(
            key: widget.key,
            onDismissed: (_) => widget.deleteTodo(context, widget.keyString),
            child: Container(
              height: 90,
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                elevation: 1.5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Colors.deepPurple[800],
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editTodo(context, textTodo);
                      },
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        value: false,
                        onChanged: (_) =>
                            _deleteTodo(context, widget.keyString),
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
          ),
        ),
      ),
    );
  }
}
