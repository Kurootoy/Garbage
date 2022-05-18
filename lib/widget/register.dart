import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/unit/dialog.dart';
import 'package:flutter_application_3/unit/my_style.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late double screen;
  String? email, password;

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => email = value.trim(),
          //เปลี่ยนสีตัวหนังสือตอนป้อน style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Email :',
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyStyle().lightColor)),
          )),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
          onChanged: (value) => password = value.trim(),
          //เปลี่ยนสีตัวหนังสือตอนป้อน style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Password :',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyStyle().lightColor)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloating(),
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
        title: Text('New Register'),
      ),
      body: Center(
        child: Column(
          children: [
            buildUser(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloating() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print('email=$email,password=$password');
        if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
          print('Have space');
          normalDialog(context, ' Please Fill Every blank');
        } else {
          print('No space');
          registerFirebase();
        }
      },
      child: Icon(Icons.cloud_upload_rounded),
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('Firebase Success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        print('Register Sucess');
        await value.user!.updateProfile(displayName: email).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/myservice', (route) => false));
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
