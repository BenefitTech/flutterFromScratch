import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedWordsPage extends StatelessWidget{

  SavedWordsPage({Key key,this.saved,this.font}) : super(key:key);

  final Set<WordPair> saved ;
  final TextStyle font;

  @override
  Widget build(BuildContext context) {
    
    final titles = saved.map(
      (pair){
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style:font,
          )
        );
      }
    );

    final divided = ListTile.
    divideTiles(
      context: context,
      tiles: titles
    ).
    toList();


    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(
        children: divided
      ),
    );
  }
}