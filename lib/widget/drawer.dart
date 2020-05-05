import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DrawerMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 7 * 5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width / 10 * 3,
              child: DrawerHeader(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 64.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/profile.png')))),
                ),
                decoration: BoxDecoration(
                  color:  Colors.amber,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 10 * 6,
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                      },
                      child: drawerLineTextWidget('Exit', Icons.exit_to_app)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerLineTextWidget(text, icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, bottom: 8.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
