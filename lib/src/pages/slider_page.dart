import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class sliderPage extends StatefulWidget {
  @override
  _sliderPageState createState() => _sliderPageState();
}

class _sliderPageState extends State<sliderPage> {
  double _sliderValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget> [
            _createSlider(),
            Expanded(
              child: _cresteImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image size',
      // divisions: 20,
      value: _sliderValue,
      min: 10,
      max: 400,
      onChanged: (value){
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _cresteImage() {
    return Image(
      image: NetworkImage('https://live.staticflickr.com/6205/6044726893_89a5264b53_b.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
