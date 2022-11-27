// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rickandmorty/src/models/character.dart';

class CharacterInfo extends StatefulWidget {
  Character character;
  CharacterInfo({Key? key, required this.character}) : super(key: key);
  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  var colorTeal = Colors.teal;
  var colorBlueG = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("CHARACTER INFO"),
        leading: null,
        actions: const <Widget>[],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.grey, Colors.blueGrey])),
              child: SizedBox(
                width: double.infinity,
                height: 330.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(widget.character.image), radius: 50.0),
                      SizedBox(height: 5.0),
                      Text(widget.character.name, style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      SizedBox(height: 5.0),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("Status", style: TextStyle(color: colorTeal, fontSize: 18.0, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0),
                                    Text(widget.character.status, style: TextStyle(fontSize: 15.0, color: colorBlueG)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("Species", style: TextStyle(color: colorTeal, fontSize: 18.0, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0),
                                    Text(widget.character.species, style: TextStyle(fontSize: 15.0, color: colorBlueG)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("Gender", style: TextStyle(color: colorTeal, fontSize: 18.0, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5.0),
                                    Text(widget.character.gender, style: TextStyle(fontSize: 15.0, color: colorBlueG)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Location", style: TextStyle(color: colorTeal, fontSize: 18.0, fontWeight: FontWeight.bold)),
                              SizedBox(width: 15.0),
                              Text(widget.character.location.name, style: TextStyle(fontSize: 15.0, color: colorBlueG)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        // elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          child: Text("EPISODES", style: TextStyle(color: colorBlueG, fontSize: 15.0, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(height: 5.0),
          showEpisodes(widget.character.episode),
        ],
      ),
    );
  }

  Widget showEpisodes(List episode) {
    final List<String> listOfEpisodes = episode.map((e) => e.toString()).toList();

    List<String> findEpisodeNumbers(episode) {
      List<String> episodeNumbers = [];
      // final List<String> listOfEpisodes = episode.map((e) => e.toString()).toList();

      for (String item in listOfEpisodes) {
        var splitted = item.split("/");
        episodeNumbers.add(splitted.last);
      }
      return episodeNumbers;
    }

    return Expanded(
        flex: 1,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          crossAxisCount: 6,
          children: findEpisodeNumbers(episode)
              .map(
                (String episodeNum) => Center(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      episodeNum,
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
