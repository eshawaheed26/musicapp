import 'package:flutter/material.dart';
import 'package:mymusicapp/components/design_box.dart';
import 'package:mymusicapp/components/mydrawer.dart';
import 'package:mymusicapp/songslist/playlist.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProv>(builder: (context, value, child) {
        final playlist = value.playlist;
        final currentSong = playlist[value.currentSongIndex ?? 0];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const Text(
                      "𝄞⨾ S O N G  P L A Y I N G ⨾𝄞",
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 159, 202),
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                DesignBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                          style: const TextStyle(fontWeight: FontWeight.bold, 
                          fontSize: 20, fontFamily: 'MyCustom',
                                    ),
                                  ),
                                  Text(currentSong.artistName),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.favorite, color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatTime(value.currentDuration),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          Icon(Icons.shuffle,
                              color: Theme.of(context).colorScheme.secondary),
                          Icon(Icons.repeat,
                              color: Theme.of(context).colorScheme.secondary),
                          Text(formatTime(value.totalDuration),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                        ],
                      ),
                    ),
                    Slider(
                      value: value.currentDuration.inSeconds.toDouble(),
                      min: 0,
                      max: value.totalDuration.inSeconds.toDouble(),
                      activeColor: Colors.green,
                      onChanged: (double newValue) {},
                      onChangeEnd: (double newValue) {
                        value.seek(Duration(seconds: newValue.toInt()));
                      },
                    )
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child:
                            const DesignBox(child: Icon(Icons.skip_previous)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: DesignBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playNextSong,
                        child: const DesignBox(child: Icon(Icons.skip_next)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
