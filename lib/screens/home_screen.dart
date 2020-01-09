import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_app/card/genre_card.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/constant/data_source_constant.dart';
import 'package:music_app/constant/text_constant.dart';
import 'package:music_app/costum/costum_fab_widget.dart';
import 'package:music_app/sevices/genre_service.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = 'home';

  GenreService genreService;

  HomeScreen(this.genreService);

  @override
  State createState() {
    return HomeScreenState(genreService);
  }
}

class HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  var genreList = List();
  var response;
  int error = 401;
  bool isLogin = false;

  GenreService genreService;

  HomeScreenState(this.genreService);

  fetchData() async {
    print("fetch data");
    response = await genreService.fetchAllGenre();
    if (response.statusCode != this.error) {
      setState(() {
        print("mashok");
        this.isLogin = true;
        genreList = List.of(jsonDecode(response.body));
        print("$genreList mashok");
      });
    }else{
      print("MASUK KEMARI");
      Navigator.pushNamed(context, LoginScreen.ROUTE_NAME, arguments: '1');
      setState(() {
        print("masuk yang tidak berguna");
        genreList = [];
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      print("onPause");
    }

    if (state == AppLifecycleState.resumed) {
      print("onResumed");
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    print("init dipanggil");
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return HomeBody(genreList, this.isLogin);
  }
}

class HomeBody extends StatelessWidget {
  var genreList = List();
  bool isLogin;

  HomeBody(this.genreList, this.isLogin);

  final tween = MultiTrackTween([
    Track("color1").add(Duration(seconds: 3),
        ColorTween(begin: Colors.black, end: Colors.black54)),
    Track("color2").add(Duration(seconds: 1),
        ColorTween(begin: Color(0xffF90093), end: Colors.black))
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FancyFab(),
        body: ControlledAnimation(
            playback: Playback.MIRROR,
            tween: tween,
            duration: tween.duration,
            builder: (context, animation) {
              return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [animation["color1"], animation["color2"]])),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: new EdgeInsets.only(
                            top: 45.0, left: 20.0, right: 30.0, bottom: 20.0),
                        width: 400,
                        child: Text(
                          TextConstant.APP_TEXT,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontFamily: "Demode",
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.blue,
                                blurRadius: 10.0,
                                offset: Offset(5.0, 5.0),
                              ),
                              Shadow(
                                color: Colors.red,
                                blurRadius: 10.0,
                                offset: Offset(-5.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: genreList.length,
                          itemBuilder: (context, index) {
                            return GenreCard(genreList[index],
                                genreList[index]["artistList"]);
                          },
                        ),
                      )
                    ],
                  ));
            }));
  }
}
