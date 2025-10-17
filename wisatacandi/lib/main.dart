import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'data/candi_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailScreen(candi: candiList[0]),
    );
  }
}

