import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  Color cor;
  IconData icon;
  Widget title, subtitle;

  TodoListItem(
      {@required this.cor,
      @required this.icon,
      @required this.title,
      @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cor,
        child: Icon(icon),
      ),
      title: title,
      subtitle: subtitle,
    );
  }
}
