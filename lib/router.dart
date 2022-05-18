import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/authen.dart';
import 'package:flutter_application_3/widget/my_service.dart';
import 'package:flutter_application_3/widget/register.dart';

final Map<String,WidgetBuilder>routes={
'/authen':(BuildContext context)=>Authen(),
'/register':(BuildContext)=>Register(),
'/myservice':(BuildContext)=>Myservice(),
};