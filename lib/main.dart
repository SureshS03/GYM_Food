import 'package:flutter/material.dart';
import 'package:gym_food/pages/AreaChart.dart';
import 'package:gym_food/pages/Blog.dart';
import 'package:gym_food/pages/CustomForms.dart';
import 'package:gym_food/pages/ToastPage.dart';
import 'package:gym_food/pages/homepage.dart';
import 'package:gym_food/test.dart';
import 'package:gym_food/widgets/ProfileCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        body: Chart(),
      ),
    );
  }
}
