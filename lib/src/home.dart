import 'package:flutter/material.dart';
import 'package:rickandmorty/src/views/character_info.dart';
import '/src/views/character_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const CharacterView();
  }
}
