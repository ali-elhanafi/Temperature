import 'package:flutter/material.dart';

class Switch1 extends StatefulWidget {
  Switch1({Key key}) : super(key: key);

  @override
  _Switch1State createState() => _Switch1State();
}

class _Switch1State extends State<Switch1> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: val ? Colors.black12 : null,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('switch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: val,
                onChanged: (newValue) {
                  setState(() {
                    val = newValue;
                  });
                })
          ],
        ),
      ),
    );
  }
}
