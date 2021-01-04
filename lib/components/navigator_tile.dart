import 'package:flutter/material.dart';

class NavigatorTile extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData icon;

  const NavigatorTile({Key key, this.title, this.onPressed, this.icon}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black26,
      shadowColor: Colors.white70,
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(title, style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),),
        onTap: onPressed,
        trailing: Icon(icon, size: 30.0, color: Colors.white )
      ),
    );

  }
}


