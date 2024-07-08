import 'package:flutter/material.dart';
import 'package:rest_api/example_three.dart';
import 'package:rest_api/example_two.dart';
import 'package:rest_api/home_screen.dart';
import 'package:http/http.dart'as http;
import 'package:rest_api/postApi/Sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SingUp(),
    );
  }
}

