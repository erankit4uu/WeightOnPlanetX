import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new HomePageState();
  }
}

class HomePageState extends State {
  int radioValue = 0;
  final TextEditingController _weightController = new TextEditingController();
  String _formattedText = "";
  double _resultWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Weight on planet X'),
      ),
      backgroundColor: Colors.blueGrey.shade300,
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            new Center(
              child: new Image(
                image: AssetImage('images/planet.png'),
                width: 200.0,
                height: 200.0,
              ),
            ),
            new Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _weightController,
                decoration: new InputDecoration(
                  labelText: 'weight on earth',
                  hintText: 'In lbs',
                  labelStyle: TextStyle(color: Colors.indigo),
                  icon: new Icon(Icons.person),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: _handleRadioValue,
                  activeColor: Colors.cyan.shade500,
                ),
                new Text(
                  'Pluto',
                  style: TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: _handleRadioValue,
                  activeColor: Colors.cyan.shade500,
                ),
                new Text(
                  'Mars',
                  style: TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: _handleRadioValue,
                  activeColor: Colors.cyan.shade500,
                ),
                new Text(
                  'Venus',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 20.0)),
            new Center(
                child: new Text(
              '$_formattedText',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _handleRadioValue(int value) {
    setState(() {
      radioValue = value;
      if(_weightController.text.toString().isEmpty){
        _formattedText = "Please enter weight";
      }else {
        switch (radioValue) {
          case 0:
            _resultWeight = _calulateWeight(_weightController.text, 0.06);
            _formattedText = "Weight on pluto is $_resultWeight";
            break;

          case 1:
            _resultWeight = _calulateWeight(_weightController.text, 0.38);
            _formattedText = "Weight on Mars is $_resultWeight";
            break;

          case 2:
            _resultWeight = _calulateWeight(_weightController.text, 0.91);
            _formattedText = "Weight on Venus is $_resultWeight";
            break;
        }
      }
    });
    debugPrint(radioValue.toString());
  }

  double _calulateWeight(String weight, double multiplier) {
    if (weight.toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      return 180 * multiplier;
    }
  }
}
