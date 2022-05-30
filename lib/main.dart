import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/UI/Products.dart';

void main() {

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppbarColor, // navigation bar color
    statusBarColor: AppbarColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductUi(),
    );
  }
}
