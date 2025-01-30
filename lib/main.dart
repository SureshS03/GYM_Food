import 'package:flutter/material.dart';
import 'package:gym_food/pages/Blog.dart';
import 'package:gym_food/pages/CustomForms.dart';
import 'package:gym_food/pages/ToastPage.dart';
import 'package:gym_food/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        body: Toastpage(),
      ),
    );
  }
}
