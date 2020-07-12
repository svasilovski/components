import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One','Two','Three','Four','Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Temp'),
      ),
      body: ListView(
        // children: _createItems()
        children: _createItemsShorth()
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for(String opt in options){
      final tempWidget = ListTile(
        title: Text( opt ),
      );

      list..add(tempWidget)
          ..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShorth() =>
      options.map((e) =>
          Column(
            children: <Widget> [
              ListTile(
                title: Text('$e!'),
                subtitle: Text('A anymore text.'),
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider()
            ]
          )
      ).toList();

}
