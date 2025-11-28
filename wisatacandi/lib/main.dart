import 'package:flutter/material.dart';
import 'package:wisatacandi/screens/favorite_screen.dart';
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
    home: MainScreen(),
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
  // TODO 1. Deklarasi Variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreens(),
    FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat Property Body berupa widget yang akan di tampilkan
      body: _children[_currentIndex],
      // TODO 3. Buat Bottom Navbar
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.deepPurple[100]), 
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          selectedItemColor: Colors.pink[200],
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
        )
      // TODO 4. Buat data dan child
      ),
    );
  }
}

