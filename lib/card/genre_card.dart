import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/artist_screen.dart';

class GenreCard extends StatelessWidget {
  var genre;
  var artist;

  GenreCard(this.genre, this.artist);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ArtistScreen.ROUTE_NAME,
                arguments: genre['idGenre'].toString());
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(10),
                child: Image.network(
                  'http://10.0.2.2/img/' + genre['idGenre'].toString() + '.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 500,
                ),
              ),
              Text(
                genre['genreName'],
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
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 110.0,
                    right: 0.0,
                  ),
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Color(0xff550a46),
                    size: 40.0,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
