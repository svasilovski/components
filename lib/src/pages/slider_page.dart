import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 125.0;
  bool _checkBlock = false;

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
            _createCheck(),
            _createSwitch(),
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
      label: 'Image size $_sliderValue',
      // divisions: 20,
      value: _sliderValue,
      min: 10,
      max: 260,
      onChanged: _checkBlock ? null : (value){
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createCheck(){
//    return Checkbox(
//      value: _checkBlock,
//      onChanged: (value) {
//        setState(() {
//          _checkBlock = value;
//        });
//      },
//    );
    return CheckboxListTile(
      title: Text('Block slider'),
      value: _checkBlock,
      onChanged: (value) {
        setState(() {
          _checkBlock = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _checkBlock,
      onChanged: (value) {
        setState(() {
          _checkBlock = value;
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
