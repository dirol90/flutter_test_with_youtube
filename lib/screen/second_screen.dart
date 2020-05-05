import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertestapp22042020/widget/custom_button.dart';
import 'package:fluttertestapp22042020/widget/drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondScreen extends StatefulWidget {
  static String route = '/second_screen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'x0uinJvhNxI',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  var _youtubeUrl;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      key: _scaffoldKey,
      drawer: DrawerMain(),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            YoutubePlayer(
              showVideoProgressIndicator: true,
              controller: _controller,
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width/4*2,
                    height: 45,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.url,
                      onChanged: (text){
                        _youtubeUrl = text;
                      },
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'URL'),
                    ),
                  ),
                  CustomButton(
                    MediaQuery.of(context).size.width/4*1,
                    40,
                    Colors.green,
                    Text(
                      'select url'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    12.0,
                    Colors.green,
                    updateUrl,
                  ).myButton,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomButton(
                    MediaQuery.of(context).size.width / 3 * 1,
                    MediaQuery.of(context).size.width / 3 * 1,
                    Colors.green,
                    IconButton(
                      icon: new Icon(Icons.play_arrow),
                      onPressed: () {
                        _controller.play();
                      },
                    ),
                    12.0,
                    Colors.green,
                    null,
                  ).myButton,
                  CustomButton(
                    MediaQuery.of(context).size.width / 3 * 1,
                    MediaQuery.of(context).size.width / 3 * 1,
                    Colors.green,
                    IconButton(
                      icon: new Icon(Icons.pause),
                      onPressed: () {
                        _controller.pause();
                      },
                    ),
                    12.0,
                    Colors.green,
                    null,
                  ).myButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  Function updateUrl(){
    var videoId = YoutubePlayer.convertUrlToId(_youtubeUrl);
    _controller.load(videoId);
  }
}
