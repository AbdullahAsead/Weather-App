import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controllers/my_provider.dart';
import 'package:weather_app_2/views/screens/register_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RegisterScreen(),
    );
  }
}
