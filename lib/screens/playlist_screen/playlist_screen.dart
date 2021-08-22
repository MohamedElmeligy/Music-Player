import 'package:flutter/material.dart';
import 'package:musician/screens/playlist_screen/album_screen.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final List<String> _images = [
    'assets/images/piano.jpg',
    'assets/images/music.jpg',
    'assets/images/music2.jpg',
    'assets/images/piano.jpg',
    'assets/images/music.jpg',
    'assets/images/music2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: 20, left: 20, top: 40),
      itemCount: 6,
      itemBuilder: (_, indx) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AlbumScreen()));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: sw * 0.5,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(_images[indx]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: sw * 0.5 - 50),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xBF000000),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Playlist", style: TextStyle(color: Colors.white)),
                      Text("Band", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
