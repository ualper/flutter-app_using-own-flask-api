import 'package:flutter/material.dart';
import 'package:rickandmorty/src/models/character.dart';
import 'package:rickandmorty/src/services/character/get_characters.dart';
import 'package:rickandmorty/src/widgets/character_list_widget.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'CHARACTER VIEW',
      theme: ThemeData(primaryColor: const Color.fromRGBO(58, 66, 86, 1.0)),
      home: const ListPage(title: 'CHARACTERS'),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Character>> futureCharacter;
  // ignore: prefer_typing_uninitialized_variables
  var characterService;
  @override
  void initState() {
    super.initState();
    characterService = CharacterService();
    futureCharacter = characterService.getAllCharacters();
    print(futureCharacter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: CharacterListWidget.getwidget(CharacterListTile.appbar, []),
      body:
          // characterFuturebuilder(futureCharacter),
          FutureBuilder<List<Character>>(
        future: futureCharacter,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: CircularProgressIndicator());
          // } else
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('Error Loading Data.'));
          } else {
            var characters = snapshot.data!;
            return CharacterListWidget.getwidget(CharacterListTile.body, characters);
          }
        },
      ),
    );
  }
}

// Widget characterFuturebuilder(var futureCharacter) {
//   return FutureBuilder<List<Character>>(
//     future: futureCharacter,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError || snapshot.data == null) {
//         return Center(child: Text('Error Loading Data.'));
//       } else {
//         var characters = snapshot.data!;
//         return CharacterListWidget.getwidget(CharacterListTile.body, characters);
//       }
//     },
//   );
// }
