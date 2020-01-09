import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/card/song_card.dart';
import 'package:music_app/constant/text_constant.dart';
import 'package:music_app/sevices/song_service.dart';

class SongScreen extends StatefulWidget {
  static const ROUTE_NAME = '/song';
  SongService songService;
  var idArtist;

  SongScreen(this.songService, this.idArtist);

  @override
  State createState() {
    return SongScreenState(songService, idArtist);
  }
}

class SongScreenState extends State {
  SongService songService;
  String idArtist;
  var response;
  var songList = List();

  SongScreenState(this.songService, this.idArtist);

  fetchSongsByArtistId() async {
    response = await songService.fetchSongsByArtistId(idArtist);
    setState(() {
      songList = List.of(jsonDecode(response.body));
      print(songList);
    });
  }

  @override
  void initState() {
    fetchSongsByArtistId();
  }

  @override
  Widget build(BuildContext context) {
//    final List songList = ModalRoute.of(context).settings.arguments;
    print('$songList ini song screen');
    return Scaffold(
      backgroundColor: Color(0xff2d132c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          TextConstant.MENU_SONG,
          style: TextStyle(
            letterSpacing: 12,
            fontSize: 25.0,
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
        elevation: 15,
      ),
      body: Material(
        child: Container(
            color: Color(0xff2d132c),
            child: ListView.builder(
                itemCount: songList.length,
                itemBuilder: (context, index) {
                  return SongCard(songList[index]);
                })),
      ),
    );
  }
}
