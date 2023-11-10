

import 'package:flutter/material.dart';
import 'package:newsapp1/view/home_screen/home.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
 void initState() {
    super.initState();
  Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => home(),)));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Image.asset(
           "",
            fit: BoxFit.cover,
          ))
        ],
      ),
    );
  }
}