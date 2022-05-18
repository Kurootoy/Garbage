import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/unit/dialog.dart';
import 'package:flutter_application_3/unit/my_style.dart';
import 'package:firebase_core/firebase_core.dart';


class ShowDevice extends StatefulWidget {
  const ShowDevice({ Key? key }) : super(key: key);

  @override
  State<ShowDevice> createState() => _ShowDeviceState();
}

class _ShowDeviceState extends State<ShowDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Show Device'),
      
    );
  }
}