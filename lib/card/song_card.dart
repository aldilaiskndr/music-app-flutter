import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/artist_screen.dart';

class SongCard extends StatelessWidget {
  var song;

  SongCard(this.song);

  @override
  Widget build(BuildContext context) {
    print('$song ini song card');
    return Card(
      color: Colors.black12,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 68,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    song['title'],
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: "D-Din",
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.blue,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        ),
                        Shadow(
                          color: Colors.red,
                          blurRadius: 1.0,
                          offset: Offset(-1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        song['songWriter'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "D-Din",
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.blue,
                              blurRadius: 1.0,
                              offset: Offset(1.0, 1.0),
                            ),
                            Shadow(
                              color: Colors.red,
                              blurRadius: 1.0,
                              offset: Offset(-1.0, 1.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 50.0,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
