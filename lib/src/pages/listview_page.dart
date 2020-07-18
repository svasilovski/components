import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listNumber = [1,2,3,4,5];

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
}
