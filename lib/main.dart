import 'package:clean_architecture_getx/app/ui/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di.dart';

void main() {
  DI.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserScreen(),
    );
  }
}
