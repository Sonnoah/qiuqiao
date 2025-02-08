import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qiuqiao/screens/card_screen.dart';
import 'package:qiuqiao/screens/home_screen.dart';
import 'package:qiuqiao/screens/main_screen.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {

    List screens = [
    const HomeScreen(),
    const MainScreen(),
    const CardScreen(),
  ];

  int _currentIndex = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: const Color.fromRGBO(	227, 98, 85, 10),
          index: _currentIndex,
          items: const [
        /////////////  HOME  /////////////          
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                child: Column(
                  children: [
                    Icon(Icons.home , size: 25, color: Colors.white,),
                    Text("Home", style: TextStyle(fontSize: 10, color: Colors.white)),
                  ],
                ),
              ),
            ),
        /////////////  MAIN  /////////////          
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                    child: Column(
                      children: [
                        Text(
                          "福",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                        Column(
                          children: [
                            Text("Fortune", style: TextStyle(fontSize: 10, color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
            ),
        /////////////  CARD  /////////////
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                child: Column(
                  children: [
                    Icon(Icons.chrome_reader_mode_outlined , size: 25, color: Colors.white),
                    Text("Card", style: TextStyle(fontSize: 10, color: Colors.white)),
                  ],
                ),
              ),
            ), 
          ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
        }),
      ),
      body: screens[_currentIndex],
    );
  }
}