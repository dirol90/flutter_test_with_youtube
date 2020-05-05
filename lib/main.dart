import 'package:flutter/material.dart';
import 'package:fluttertestapp22042020/screen/first_screen.dart';
import 'package:fluttertestapp22042020/screen/second_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test App 23042020',
      theme: ThemeData(
        primaryColor: Colors.limeAccent,
      ),
      routes: {
        FirstScreen.route: (context) => FirstScreen(),
        SecondScreen.route: (context) => SecondScreen(),
      },
      initialRoute: FirstScreen.route,
    );
  }
}
