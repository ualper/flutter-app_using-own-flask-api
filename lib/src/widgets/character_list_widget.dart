import 'package:flutter/material.dart';
import 'package:rickandmorty/src/models/character.dart';
import 'package:rickandmorty/src/views/character_info.dart';

enum CharacterListTile { appbar, body }

class CharacterListWidget {
  static getwidget(CharacterListTile x, List<Character> characters) {
    switch (x) {
      case CharacterListTile.appbar:
        return appBar;
      case CharacterListTile.body:
        return listView(characters);
    }
  }
}

Widget appBar = AppBar(
  elevation: 0.1,
  backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
  title: const Text("CHARACTERS"),
  leading: null,
  actions: const <Widget>[],
);

listView(List<Character> characters) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    // TODO : ITEMCOUNT WILL BE MAX ID
    itemCount: characters.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          //TODO MAKE THIS LISTILE TAPPABLE
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            leading: Container(
              padding: const EdgeInsets.only(right: 10.0),
              decoration: const BoxDecoration(border: Border(right: BorderSide(width: 1.5, color: Colors.white24))),
              child: CircleAvatar(
                radius: 30,
                //TODO this will be character image url // var imageURL = ch.first["image"].toString();
                backgroundImage: NetworkImage(characters[index].image.toString()),
                // backgroundImage: NetworkImage("https://rickandmortyapi.com/api/character/avatar/9.jpeg"),
              ),
            ),
            title: Text(
              characters[index].name,
              // "NAME OF CHARACTER",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            isThreeLine: true,
            subtitle: Row(children: <Widget>[
              Expanded(
                child: Text(
                  characters[index].status.toString() + ' - ' + characters[index].species.toString() + '\nLocation : ' + characters[index].location.name.toString(),
                  style: TextStyle(color: Colors.white),
                  // maxLines: 20,
                ),
              ),
            ]),
            trailing: null,
            // onTap: () => Get.to(CharacterInfo(character: characters[index])),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CharacterInfo(character: characters[index]),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
