import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumber = new List();
  int _finalItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Stack(
        children: <Widget> [
          _createList(),
          _createLoading(),
        ],
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumber.length,
        itemBuilder: (BuildContext context, int index) {
          final imageNumber = _listNumber[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imageNumber'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
      }
      ),
    );
  }

  Future<Null> getPageOne() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumber.clear();
      _finalItem++;
      _addTen();
    });
    return Future.delayed(duration);
  }

  void _addTen(){
    for(var i = 1; i < 10; i++ ) {
      _finalItem++;
      _listNumber.add(_finalItem);
    }

    setState(() { });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() { });
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
    );

    _addTen();
  }

  Widget _createLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CircularProgressIndicator(),
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
