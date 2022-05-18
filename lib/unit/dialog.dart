import 'package:flutter/material.dart';
import 'package:flutter_application_3/unit/my_style.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/cross.png'),
        title: Text(
          'Have space',
          style: MyStyle().redBoldStyle()
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
        child: Text('OK')
        ),
      ],
    ),
  );
}
