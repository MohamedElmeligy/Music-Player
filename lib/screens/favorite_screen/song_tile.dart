import 'package:flutter/material.dart';

import 'package:musician/models/song_model.dart';

class FavoriteTile extends StatefulWidget {
  final Song song;
  FavoriteTile({required this.song});

  @override
  _FavoriteTileState createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: sh * 0.5,
      width: sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.song.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Color(0xBFFFFFFF)
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.song.name),
                    Text(widget.song.author),
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
