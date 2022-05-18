import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/unit/my_style.dart';
import 'package:flutter_application_3/widget/information.dart';
import 'package:flutter_application_3/widget/show_device.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  late String name, email;
  Widget currentWidget = ShowDevice();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event!.displayName!;
          email = event.email!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: Stack(
      children: [
        Column(
          children: [
            buildDrawerHeader(),
            buildListTitleDevice(),
            buildInformation(),
          ],
        ),
        buildSignOut(),
      ],
    ));
  }

  ListTile buildListTitleDevice() {
    return ListTile(
      leading: Icon(
        Icons.perm_device_info,
        size: 36,
      ),
      title: Text("Show Device"),
      onTap: () {
        setState(() {
          currentWidget = ShowDevice();
        });
        Navigator.pop(context);
      },
    );
  }

    ListTile buildInformation() {
    return ListTile(
      leading: Icon(
        Icons.account_box,
        size: 36,
      ),
      title: Text("Information"),
      subtitle: Text("Information of User Login"),
      onTap: () {
        setState(() {
          currentWidget = Information();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: MyStyle().darkColor),
      accountName: MyStyle().titleH2White('Admin'),
      accountEmail: MyStyle().titleH3white(email == null ? 'email' : email),
      currentAccountPicture: Image.asset('images/cross.png'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          tileColor: MyStyle().darkColor,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 60,
          ),
          title: MyStyle().titleH2White('Sign Out'),
          subtitle: MyStyle().titleH3white('Signout & Go to Authen'),
        ),
      ],
    );
  }
}
