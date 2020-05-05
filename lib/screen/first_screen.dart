import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertestapp22042020/screen/second_screen.dart';
import 'package:fluttertestapp22042020/widget/custom_button.dart';
import 'package:fluttertestapp22042020/widget/drawer.dart';

class FirstScreen extends StatelessWidget {
  static String route = '/';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMain(),
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: 24,
                ),
              ),
            ),
          ),
          Center(
            child: CustomButton(
              MediaQuery.of(context).size.width / 3 * 2,
              50,
              Colors.green,
              Text(
                'next page'.toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              12.0,
              Colors.green,
              buttonFun,
            ).myButton,
          )
        ],
      ),
    );
  }

  buttonFun() {
    Navigator.of(_context).pushNamed(SecondScreen.route);
  }

  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
}
