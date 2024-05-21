import 'package:flutter/material.dart';
import 'package:mymusicapp/components/mydrawer.dart';
import 'package:mymusicapp/songslist/playlist.dart';
import 'package:mymusicapp/songslist/song.dart';
import 'package:mymusicapp/songslist/songpage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PlaylistProv playlistProv;

  @override
  void initState() {
    super.initState();
    playlistProv = Provider.of<PlaylistProv>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProv.currentSongIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SongPage()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("M Y  P L A Y L I S T"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 202, 169, 190),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProv>(
          builder: (context, value, child) {
            final List<Song> playlist = value.playlist;
            
            return Padding(
  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16), 
  child: ListView.builder(
    itemCount: playlist.length,
    itemBuilder: (context, index) {
      final Song song = playlist[index];
      return GestureDetector(
        onTap: () => goToSong(index),
        child: Container(
          margin: const EdgeInsets.only(bottom: 15), 
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: const Border(bottom: BorderSide(color: Color.fromARGB(255, 186, 133, 197))),
            gradient:const LinearGradient(
              colors: [Color.fromARGB(255, 224, 154, 154), Color.fromARGB(255, 209, 169, 219)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), 
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                song.albumArtImagePath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.songName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'MyCustom',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      song.artistName,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 93, 22, 102),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      );
    },
  ),
);



          },
        ),
      
    );
  }
}
