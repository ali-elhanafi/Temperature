import 'package:flutter/material.dart';

class Project1 extends StatefulWidget {
  Project1({Key key}) : super(key: key);

  @override
  _Project1State createState() => _Project1State();
}

class _Project1State extends State<Project1> {
  double inTemp = 0.0, outTemp = 0.0;
  bool isFeh = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('temprature'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'entar your temprature',
                labelText: isFeh
                    ? "you enter $inTemp fehrnhait"
                    : "you enter $inTemp celcine",
              ),
              onChanged: (value) {
                //catch exption without crashing the app
                try {
                  inTemp = double.parse(value);
                } catch (e) {
                  //show dialog ('invalid input')
                }
              },
            ),
            RadioListTile(
                title: Text('fahrnhite'),
                value: true,
                groupValue: isFeh,
                onChanged: (newValue) {
                  setState(() {
                    isFeh = true;
                  });
                }),
            RadioListTile(
                title: Text('fahrnhite'),
                value: false,
                groupValue: isFeh,
                onChanged: (newValue) {
                  setState(() {
                    isFeh = newValue;
                  });
                }),
            RaisedButton(
                child: Text('convert'),
                onPressed: () {
                  setState(() {
                    outTemp =
                        isFeh ? (inTemp - 32) / (5 / 6) : (inTemp * 9 / 5) - 32;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('result'),
                              content: isFeh
                                  ? Text(
                                      '$inTemp is fehrnhait = $outTemp clicias')
                                  : Text(
                                      '$inTemp is clicec = $outTemp fehrnhait'),
                            ));
                  });
                })
          ],
        ),
      ),
    );
  }
}
