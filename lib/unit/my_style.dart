import 'package:flutter/material.dart';
class MyStyle{
  Color darkColor= Color(0xffc79a00);
  Color prinaryColor= Color(0xffffca28);
  Color lightColor= Color(0xfffffd61);
  Color bgColor=Color(0xff8e8e8e);
  TextStyle redBoldStyle()=>TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold
              );

  Widget showLogo()=>Image.asset('images/Logo.png');

  Widget titleH1(String string)=>Text(
    string, 
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      ),
      );

      Widget titleH2(String string)=>Text(
    string, 
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      ),
      );

       Widget titleH2White(String string)=>Text(
    string, 
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      ),
      );

      Widget titleH3(String string)=>Text(
    string, 
    style: TextStyle(
      fontSize: 16,
      ),
      );

      Widget titleH3white(String string)=>Text(
    string, 
    style: TextStyle(
      fontSize: 16,
      color: Colors.white70,
      ),
      );



  MyStyle();

}