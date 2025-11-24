import 'package:flutter/material.dart';
import 'package:wisatacandi/screens/home_screen.dart';
import 'package:wisatacandi/screens/profile_screens.dart';
import 'package:wisatacandi/screens/search_screen.dart';
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
    // title: 'Wisata Candi',
    // theme: ThemeData(
    //   appBarTheme: const AppBarTheme(
    //     iconTheme: IconThemeData(color: Colors.deepPurple),
    //     titleTextStyle: TextStyle(
    //       color: Colors.pink,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
    //     primary: Colors.pink[100],
    //     surface: Colors.pink[200],
    //   ),
    //   useMaterial3: true,
    // ),
    // home: HomeScreen(),
    );  
    //   home: DetailScreen(candi: candiList[0]),
    // );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

