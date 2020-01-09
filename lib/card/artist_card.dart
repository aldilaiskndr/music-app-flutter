import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/artist_screen.dart';
import 'package:music_app/screens/song_screen.dart';

class ArtistCard extends StatelessWidget {
  var artist;
  var songs;

  ArtistCard(this.artist, this.songs);

  @override
  Widget build(BuildContext context) {
    print('$artist ini card');
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SongScreen.ROUTE_NAME,
                arguments: artist['id']);
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(10),
                child: Image.network(
                  'http://10.0.2.2/img/' + artist['id'].toString() + '.jpg',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 500,
                ),
              ),
              Text(
                artist['name'],
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
              )
            ],
          )),
    );
  }
}
