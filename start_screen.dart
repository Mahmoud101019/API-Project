import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Album.dart';
import 'AlbuomModel.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    fetchAlbum();
    super.initState();
  }

  List<News> albums = [];

  bool loaded = false;

  fetchAlbum() async {
    loaded = true;
    setState(() {});
    print("ddddddddddddddddddddddddd");
    var data = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=ec29b0dd18f04052a600f2761ec7542f'));
    int len = jsonDecode(data.body).length;
    print(len);
    for (int i = 0; i < 20; i++) {
      albums.add(News.fromJson(jsonDecode(data.body)[i]));
    }
    loaded = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("APIS AND NETWORK"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: loaded == false
              ? ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWidget(
                      //  title: albums[index].title,
                      //  urlToImage: albums[index].urlToImage,
                      title: albums[index].status,
                      urlToImage: albums[index].urlToImage,
                    );
                  })
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
