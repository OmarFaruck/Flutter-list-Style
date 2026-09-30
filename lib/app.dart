import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

import 'navber.dart';
// import 'package:flutter_projects/home_page.dart';
// import 'package:flutter_projects/navber.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'batch 19',
      // home: HomePage(),
      home: navber(),
      debugShowCheckedModeBanner: false,
    );
  }


}