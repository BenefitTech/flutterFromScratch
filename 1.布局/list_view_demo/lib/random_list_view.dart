import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'saved_page.dart';

class RandomWordsList extends StatefulWidget{

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWordsList>{

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        // 提示: 某些widget属性需要单个widget（child），而其它一些属性，如action，需要一组widgets(children），用方括号[]表示
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        
        ],
      ),
      body: _buildSuggestions(),

    );
  }

  // push新页面
  void _pushSaved(){
    // 新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
    // 添加Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          return SavedWordsPage(saved:_saved,font:_biggerFont);
        }
      )
    );
  }

  
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){

    final alreadySaved = _saved.contains(pair);
    
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style:_biggerFont
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite: Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}