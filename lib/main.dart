import 'package:flutter/material.dart';
import 'package:newsapp1/contoller/homescreencontroller.dart';
import 'package:newsapp1/view/home_screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(newsapp1());
}

class newsapp1 extends StatefulWidget {
  const newsapp1({super.key});

  @override
  State<newsapp1> createState() => _newsapp1State();
}

class _newsapp1State extends State<newsapp1> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => homescreenprovider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
      ),
    );
  }
}
