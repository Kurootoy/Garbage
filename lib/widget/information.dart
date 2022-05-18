import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/unit/dialog.dart';
import 'package:flutter_application_3/unit/my_style.dart';
import 'package:firebase_core/firebase_core.dart';

class Information extends StatefulWidget {
  const Information({ Key? key }) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Accout'),
      
    );
  }
}