import 'package:flutter/material.dart';

class Radio1 extends StatefulWidget {
  Radio1({Key key}) : super(key: key);

  @override
  _Radio1State createState() => _Radio1State();
}

class _Radio1State extends State<Radio1> {
  Color val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: val,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('radio'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Radio(
                value: Colors.blue,
                groupValue: val,
                onChanged: (newValue) {
                  setState(() {
                    val = newValue;
                  });
                }),
            Radio(
                value: Colors.red,
                groupValue: val,
                onChanged: (newValue) {
                  setState(() {
                    val = newValue;
                  });
                }),
            RadioListTile(
                title: Text('orange'),
                value: Colors.orange,
                groupValue: val,
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
