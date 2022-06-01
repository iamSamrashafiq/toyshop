import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/RouteConstants.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/Routes/AppRoutes.dart';

void main() {

  runApp(
      MultiProvider(
          providers: providers,
          child: const MyApp()
      )
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppbarColor, // navigation bar color
    statusBarColor: AppbarColor,
  ));
}


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),

];

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstants.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
