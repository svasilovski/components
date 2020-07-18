import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumber = new List();
  int _finalItem = 0;

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _addTen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listNumber.length,
      itemBuilder: (BuildContext context, int index) {
        final imageNumber = _listNumber[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imageNumber'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
    }
    );
  }

  void _addTen(){
    for(var i = 1; i < 10; i++ ) {
      _finalItem++;
      _listNumber.add(_finalItem);
    }

    setState(() { });
  }
}
