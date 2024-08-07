import 'package:advance_flutter_exam/Provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/DetailScreen.dart';
import 'View/HomePage.dart';
import 'View/cartScreen.dart';
import 'View/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ExamProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/detail': (context) => DetailPage(),
          '/cart': (context) => CartPage(),
        },
      ),
    );
  }
}
