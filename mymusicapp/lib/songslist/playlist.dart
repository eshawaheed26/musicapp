import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mymusicapp/songslist/song.dart';

class PlaylistProv extends ChangeNotifier {
  final List<Song> _playlist = [
   
    Song(
      songName: "Your Power",
      artistName: "Billie Eilish",
      albumArtImagePath: "assets/yourpower.jpeg",
      audioPath: "audio/yourpower.mp3",
    ),

    Song(
      songName: "You Belong With Me",
      artistName: "Taylor Swift",
      albumArtImagePath: "assets/ybwm.jpg",
      audioPath: "audio/ybwm.mp3",
    ),

    Song(
      songName: "Unstoppable",
      artistName: "Sia",
      albumArtImagePath: "assets/unstoppable.jpg",
      audioPath: "audio/unstoppable.mp3",
    ),
    Song(
      songName: "Baila Conmigo",
      artistName: "Selena Gomez / Rauw Alejandro",
      albumArtImagePath: "assets/bailaconmigo.jpg",
      audioPath: "audio/bailaconmigo.mp3",
    ),
    Song(
      songName: "Get You The Moon",
      artistName: "Kina",
      albumArtImagePath: "assets/getyouthemoon.jpg",
      audioPath: "audio/getyouthemoon.mp3",
    ),
    Song(
      songName: "Respect",
      artistName: "Aretha Franklin",
      albumArtImagePath: "assets/respect2.jpg",
      audioPath: "audio/respect.mp3",
    ),
    Song(
      songName: "Calm Down",
      artistName: "Rema",
      albumArtImagePath: "assets/calmdown.png",
      audioPath: "audio/calmdown.mp3",
    ),
    Song(
      songName: "Let Me Love You",
      artistName: "DJ Snake",
      albumArtImagePath: "assets/letmeloveyou.jpg",
      audioPath: "audio/letmeloveyou.mp3",
    ),
    Song(
      songName: "Despacito",
      artistName: "Luis Fonsi",
      albumArtImagePath: "assets/despacito.jpg",
      audioPath: "audio/despacito.mp3",
    ),
    Song(
      songName: "We Don't Talk Anymore",
      artistName: "Charlie Puth",
      albumArtImagePath: "assets/wdta.jpg",
      audioPath: "audio/wdta.mp3",
    ),
    Song(
      songName: "Love Story",
      artistName: "Taylor Swift",
      albumArtImagePath: "assets/lovestory.png",
      audioPath: "audio/lovestory.mp3",
    ),
    Song(
      songName: "Shape Of You",
      artistName: "Ed Sheeran",
      albumArtImagePath: "assets/shapeofyou2.jpeg",
      audioPath: "audio/shapeofyou.mp3",
    ),
  ];

  int? _currentSongIndex;

// Duration/Time
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProv() {
    listenToDuration();
  }

  // atfirst, is stopped
  bool _isPlaying = false;

// for playing
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // for pausing
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

// resume playing after pause
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

// use one button to pause and resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

// to change position of duration
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

// to go to next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song, to go to first song
        currentSongIndex = 0;
      }
    }
  }

// to go to previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  void listenToDuration() {
  _audioPlayer.onDurationChanged.listen((newDuration) {
    _totalDuration = newDuration;
  });

  _audioPlayer.onPositionChanged.listen((newPosition) {
    updateCurrentPosition(newPosition);
  });

  _audioPlayer.onPlayerComplete.listen((event) {
    playNextSong();
  });
}

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
  void updateCurrentPosition(Duration position) {
  _currentDuration = position;
  notifyListeners();
}

}


