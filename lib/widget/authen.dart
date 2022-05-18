import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/unit/dialog.dart';
import 'package:flutter_application_3/unit/my_style.dart';
import 'package:firebase_core/firebase_core.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  late double screen;
  bool statusRedEye = true;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen=$screen');
    return Scaffold(
      floatingActionButton: buildRegister(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.3),
              radius: 0.5,
              colors: <Color>[Colors.white, MyStyle().prinaryColor]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().titleH1('Garbage '),
                buildUser(),
                buildPassword(),
                buildLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildRegister() => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text('Register',
            style:
                TextStyle(color: Colors.white60, fontWeight: FontWeight.bold)),
      );

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: ElevatedButton(
        onPressed: () {
        if ((email.isEmpty) || (password.isEmpty)) {
            normalDialog(context, 'Please Fill Every Blnak');
            
          } else {
            checkAuth();
          }
        },
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape:RoundedRectangleBorder
          (borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

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
            hintText: 'email :',
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
          obscureText: statusRedEye,
          //เปลี่ยนสีตัวหนังสือตอนป้อน style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: statusRedEye
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                  print('statusRedEye=$statusRedEye');
                }),
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

  Container buildLogo() {
    return Container(
      width: screen * 0.08,
      child: MyStyle().showLogo(),
    );
  }

  Future<Null> checkAuth()async {
    await Firebase.initializeApp().then((value)async{
      await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/myservice', (route) => false))
      .catchError((value) => normalDialog(context, value.message));
    
    });
  }
}
