import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/router.dart';
String initialRount ='/authen';
Future<Null> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp().then((value)async{
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event !=null) {
        initialRount='/myservice';
      }
      runApp(MyApp());
     });

  });

}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/authen',
      
    );
  }
}