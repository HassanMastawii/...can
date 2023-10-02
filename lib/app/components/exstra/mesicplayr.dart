// import 'package:flutter/material.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:audioplayers/audioplayers.dart';

// class MusicPlayer extends StatefulWidget {
//   @override
//   _MusicPlayerState createState() => _MusicPlayerState();
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   OnAudioQuery audioQuery = OnAudioQuery();
//   AudioPlayer audioPlayer = AudioPlayer();
//   List<SongModel> songs = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchSongs();
//   }

//   void fetchSongs() async {
//     songs = await audioQuery.querySongs();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: songs.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(songs[index].title),
//             onTap: () {
//               playMusic(songs[index]);
//             },
//           );
//         },
//       ),
//     );
//   }

//   void playMusic(SongModel song) {
//     audioPlayer.play(song.filePath);
//   }
// }
