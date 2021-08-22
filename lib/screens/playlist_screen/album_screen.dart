import 'package:flutter/material.dart';
import 'package:musician/models/song_model.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<Song> _songs = [
    Song(
      song: 'assets/audio/ghaba.mp3',
      name: "Ghaba",
      author: "Marwan Pablo",
      image:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pixelstalk.net%2Fwp-content%2Fuploads%2F2016%2F07%2FMusic-Note-Image-Free-Download.jpg",
    ),
    Song(
      song: 'assets/audio/ya2ot.mp3',
      name: "A8la mn el ya2ot",
      author: "Ahmed Mekky",
      image:
          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fgetwallpapers.com%2Fwallpaper%2Ffull%2Fc%2Fd%2F0%2F1106332-full-size-music-instrument-wallpaper-1920x1080-meizu.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: Column(
        children: [
          Container(
            height: sh * 0.3,
            color: Colors.pink[900],
            child: Row(
              children: [
                Container(
                  width: sw * 0.3,
                  height: sw * 0.3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/music.jpg"),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.white),
                  ),
                ),
                Column(
                  children: [
                    Text("Sanat 80"),
                    Text("Hamza Namira"),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: sh * 0.7,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.pink[700],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (_, indx) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(color: Color(0x99880E4F)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Song $indx"),
                          Text("Hakona matata"),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {},
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
