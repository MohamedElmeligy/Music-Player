import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musician/screens/favorite_screen/favorite_screen.dart';
import 'package:musician/screens/playlist_screen/playlist_screen.dart';

import 'package:musician/models/song_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final List _pages = [
    PlaylistScreen(),
    Center(child: Text("Home")),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.album), label: "Playlists"),
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
        onTap: (indx) {
          _currentIndex = indx;
          setState(() {});
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
