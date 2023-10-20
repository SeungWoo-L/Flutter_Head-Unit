import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

class MusicInfo {
  const MusicInfo(this.title, this.url);
  final String title;
  final String url;
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  final List<MusicInfo> fromStorage = const [
    MusicInfo('nyancat',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('chrome_cast',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3')
  ];

  final List<MusicInfo> fromServer = const [
    MusicInfo('nyancat',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('chrome_cast',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('what',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('is',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('this',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('list',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('going',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('to',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3'),
    MusicInfo('do',
        'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3')
  ];

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final Player player = Player();
  final playable = Media(
      'https://github.com/Lagavulin9/media_repo/raw/main/audios/happy-day.mp3');

  @override
  void initState() {
    super.initState();
    player.open(playable, play: false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void open_media(MusicInfo item) {
    player.open(Media(item.url));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              largeTitle: Text("Music", style: TextStyle(fontSize: 40)),
            ),
            SliverFillRemaining(
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CupertinoListSection.insetGrouped(
                          header: const Text("Local Storage"),
                          //header: CupertinoSearchTextField(placeholder: "Search"),
                          children: [
                            ...widget.fromStorage.map((item) {
                              return CupertinoListTile.notched(
                                  title: Text(item.title),
                                  onTap: () {
                                    open_media(item);
                                  });
                            })
                          ],
                        ),
                        CupertinoListSection.insetGrouped(
                          header: const Text("Media Server"),
                          children: [
                            ...widget.fromServer.map((item) {
                              return CupertinoListTile.notched(
                                  title: Text(item.title), onTap: () {});
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(children: [
                  CupertinoButton(
                      child: Icon(Icons.pause),
                      onPressed: () {
                        player.pause();
                      }),
                  CupertinoButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: () {
                        player.pause();
                      })
                ])
              ]),
            )
          ]),
    );
  }
}
