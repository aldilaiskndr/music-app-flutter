import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/card/artist_card.dart';
import 'package:music_app/constant/data_source_constant.dart';
import 'package:music_app/constant/text_constant.dart';
import 'package:music_app/sevices/artist_service.dart';


class ArtistScreen extends StatefulWidget{
  static const ROUTE_NAME = '/artist';
  ArtistService artistService;
  String idGenre;

  ArtistScreen(this.artistService, this.idGenre);

  @override
  State createState() {
    return ArtistScreenState(artistService, idGenre);
  }
}

class ArtistScreenState extends State {
  ArtistService artistService;
  var idGenre;
  var response;
  var artistList = List();
  ArtistScreenState(this.artistService, this.idGenre);

  fetchDataArtistByGenreId() async{
    response = await artistService.fetchArtistsByGenreId(idGenre);
    setState(() {
      artistList = List.of(jsonDecode(response.body));
      print(artistList);
    });
  }

  @override
  void initState() {
    fetchDataArtistByGenreId();
  }
  @override
  Widget build(BuildContext context) {
    print('$artistList ArtistScreen');
    return Scaffold(
      backgroundColor: Color(0xff2d132c),
      appBar: AppBar(
        title: Text(
          'Artist List',
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
        backgroundColor: Colors.transparent,
      ),
      body: ArtistBody(artistList),
    );
  }
}

class ArtistBody extends StatelessWidget {
  var artistList = List();

  ArtistBody(this.artistList);

  @override
  Widget build(BuildContext context) {
    print('$artistList ini screen lagi');
    return Material(
      child: Container(
        color: Color(0xff2d132c),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                itemCount: artistList.length,
                primary: true,
                padding: const EdgeInsets.all(10),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ArtistCard(artistList[index], artistList[index]['songs']);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
