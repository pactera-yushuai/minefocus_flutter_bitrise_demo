import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'main_tab_page.dart';
import 'r.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LanuchPage(),
    );
  }
}


class LanuchPage extends StatefulWidget {
  @override
  _LanuchPageState createState() => _LanuchPageState();
}

class _LanuchPageState extends State<LanuchPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Get.off(MainTabPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Image.asset(R.imagesImage),
          ),
        ),
      ),
    );
  }
}




