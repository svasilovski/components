import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Card Title'),
            subtitle: Text('This is a subtitle of card.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: (){ },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){ },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget> [
          FadeInImage(
            image: NetworkImage('https://www.publicdomainpictures.net/pictures/120000/velka/forest-landscape-1432920247hd5.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
//          Image(
//            image: NetworkImage('https://www.publicdomainpictures.net/pictures/120000/velka/forest-landscape-1432920247hd5.jpg'),
//          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Some text in here.'),
          )
        ],
      ),
    );
  }
}
