import 'package:flutter/material.dart';
import 'package:music_app/constant/text_constant.dart';
import 'package:music_app/screens/artist_screen.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/song_screen.dart';
import 'package:music_app/sevices/artist_service.dart';
import 'package:music_app/sevices/genre_service.dart';
import 'package:music_app/sevices/song_service.dart';
import 'package:music_app/sevices/user_service.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        checkerboardOffscreenLayers: true,
        title: TextConstant.APP_TEXT,
        initialRoute: LoginScreen.ROUTE_NAME,
//        routes: {
//          HomeScreen.ROUTE_NAME: (context) => HomeScreen(GenreService()),
//          ArtistScreen.ROUTE_NAME: (context) => ArtistScreen(),
//          SongScreen.ROUTE_NAME: (context) => SongScreen(),
//        },
        onGenerateRoute: (RouteSettings settings) {
          var route = <String, WidgetBuilder> {
            HomeScreen.ROUTE_NAME: (context) => HomeScreen(GenreService()),
            ArtistScreen.ROUTE_NAME: (context) => ArtistScreen(ArtistService(), settings.arguments),
            SongScreen.ROUTE_NAME: (context) => SongScreen(SongService(), settings.arguments),
            LoginScreen.ROUTE_NAME : (context)=> LoginScreen(UserService()),
          };
          WidgetBuilder widgetBuilder = route[settings.name];
          return MaterialPageRoute(builder: (context)=>widgetBuilder(context));
        },
      ),
    );
