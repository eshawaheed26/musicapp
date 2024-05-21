import 'package:flutter/material.dart';
import 'package:mymusicapp/songslist/playlist.dart';
import 'package:mymusicapp/themes/theme.provider.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => PlaylistProv()),
    ],
    child: const MyMusicApp(),
    ),

    );
}

class MyMusicApp extends StatelessWidget {
  const MyMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), 
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
