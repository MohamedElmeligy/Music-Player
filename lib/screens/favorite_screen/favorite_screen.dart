import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musician/screens/favorite_screen/song_tile.dart';

import 'package:musician/models/song_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final AudioPlayer _player = AudioPlayer();

  double _currentSliderValue = 0;
  bool _isPlaying = false;
  int _currentSong = 0;
  double _maxDuration = 0;

  List<Song> _songs = [
    Song(
      song: 'assets/audio/ghaba.mp3',
      name: "Ghaba",
      author: "Marwan Pablo",
      image: "assets/images/piano.jpg",
    ),
    Song(
      song: 'assets/audio/ya2ot.mp3',
      name: "A8la mn el ya2ot",
      author: "Ahmed Mekky",
      image: 'assets/images/music.jpg',
    ),
  ];

  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAsset('assets/audio/ghaba.mp3');
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void play() {
    _isPlaying = true;
    _player.play();
    _maxDuration = _player.duration!.inSeconds.toDouble();
    setState(() {});
  }

  void pause() {
    _isPlaying = false;
    _player.pause();
    setState(() {});
  }

  void next() async {
    _currentSong == _songs.length - 1 ? _currentSong = 0 : _currentSong++;
    await _player.setAsset(_songs[_currentSong].song);
    play();
  }

  void prev() async {
    _currentSong == 0 ? _currentSong = _songs.length - 1 : _currentSong--;
    await _player.setAsset(_songs[_currentSong].song);
    play();
  }

  void forward() {
    _player.seek(Duration(seconds: _player.position.inSeconds + 10));
  }

  void back() {
    _player.seek(Duration(seconds: _player.position.inSeconds - 10));
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Swiper(
            itemCount: _songs.length,
            itemBuilder: (_, indx) => FavoriteTile(song: _songs[indx]),
            layout: SwiperLayout.TINDER,
            itemHeight: sw * 1.5,
            itemWidth: sw * 0.9,
            onIndexChanged: (indx) => _currentSong = indx,
          ),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: _maxDuration,
            label: _currentSliderValue.toString(),
            onChanged: (double value) {
              _player.seek(Duration(seconds: value.round()));
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.double_arrow),
                onPressed: () => back(),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => prev(),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                onPressed: _isPlaying ? pause : play,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => next(),
              ),
              IconButton(
                icon: Icon(Icons.double_arrow),
                onPressed: () => forward(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
