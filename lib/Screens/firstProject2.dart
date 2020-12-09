import 'package:flutter/material.dart';

class Temprture extends StatefulWidget {
  Temprture({Key key}) : super(key: key);

  @override
  _TemprtureState createState() => _TemprtureState();
}

class _TemprtureState extends State<Temprture> {
  double fehTemp = 0.0;
  double celTemp = 0.0;
  bool isFah = true;
  var fehController = TextEditingController();
  var celController = TextEditingController();
  var tempertures = ['ceilsese', 'fehrnhait', 'Kaivin'];
  var temp1 = 'ceilsese';
  var temp2 = 'fehrnhait';
  var k1 = 'C';
  var k2 = 'F';
  @override
  void initState() {
    super.initState();
    fehController.addListener(fehListener);
    celController.addListener(celListener);
  }

  fehListener() {
    setState(() {
      fehTemp = double.parse(fehController.text);
      if (isFah) {
        switch (temp2) {
          case 'ceilsese':
            switch (temp1) {
              case 'fehrnhait':
                celTemp = convertCtoF(fehTemp);
                break;
              case 'Kaivin':
                celTemp = convertCtoK(fehTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          case 'fehrnhait':
            switch (temp1) {
              case 'ceilsese':
                celTemp = convertFtoC(fehTemp);
                break;
              case 'Kaivin':
                celTemp = convertFtoK(fehTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          case 'Kaivin':
            switch (temp1) {
              case 'ceilsese':
                celTemp = convertKtoC(fehTemp);
                break;
              case 'fehrnhait':
                celTemp = convertKtoF(fehTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          default:
            break;
        }
        celController.text = celTemp.toString();
      }
      isFah = true;
    });
    // celTemp = convert(fehTemp, true);
    // if (isFah) celController.text = celTemp.toString();
    // isFah = true;
  }

  celListener() {
    setState(() {
      //assigen new value to the from user
      celTemp = double.parse(celController.text);
      // if (k1 == 'C' && k2 == 'K') {
      //   fehTemp = convertCtoK(celTemp);
      // } else if (k1 == 'F' && k2 == 'K') {
      //   fehTemp = convertFtoK(celTemp);
      // } else if (k1 == 'C' && k2 == 'F') {
      //   fehTemp = convertCtoF(celTemp);
      // } else if (k1 == 'F' && k2 == 'C') {
      //   fehTemp = convertFtoC(celTemp);
      // } else if (k1 == 'K' && k2 == 'F') {
      //   fehTemp = convertKtoF(celTemp);
      // } else {
      //   fehTemp = convertKtoC(celTemp);
      // }
      if (!isFah) {
        switch (temp1) {
          case 'ceilsese':
            switch (temp2) {
              case 'fehrnhait':
                fehTemp = convertCtoF(celTemp);
                break;
              case 'Kaivin':
                fehTemp = convertCtoK(celTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          case 'fehrnhait':
            switch (temp2) {
              case 'ceilsese':
                fehTemp = convertFtoC(celTemp);
                break;
              case 'Kaivin':
                fehTemp = convertFtoK(celTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          case 'Kaivin':
            switch (temp2) {
              case 'ceilsese':
                fehTemp = convertKtoC(celTemp);
                break;
              case 'fehrnhait':
                fehTemp = convertKtoF(celTemp);
                break;
              default:
                fehTemp = celTemp;
                break;
            }
            break;
          default:
            break;
        }
        fehController.text = fehTemp.toString();
      }
      isFah = false;

      //call method
      // fehTemp = convert(celTemp, false);
      // convert data from double to string then pass it  fehcontrollar
      // if (!isFah) fehController.text = fehTemp.toString();
      // crush the other listener
      // isFah = false;
    });
  }

  double convertCtoF(double value) {
    return ((value) * (9 / 5)) + (32);
  }

  double convertCtoK(double value) {
    return value + 273.15;
  }

  double convertFtoC(double value) {
    return (value - 32) * (5 / 9);
  }

  double convertFtoK(double value) {
    return (((75 * value) + 459.67)) * (5 / 9);
  }

  double convertKtoC(double value) {
    return value - 273.15;
  }

  double convertKtoF(double value) {
    return (1.8 * (value - 273) + 32);
  }
  // double convert(double temp, bool isF) {
  //   return isF ? (temp - 32) * (5 / 9) : (temp * 9 / 5) + 32;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('leson 2'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  DropdownButton(
                    items: tempertures.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    value: temp1,
                    onChanged: (newValue) {
                      setState(() {
                        temp1 = newValue;
                        if (temp1 == tempertures[0]) {
                          return k1 = 'C';
                        }

                        if (temp1 == tempertures[1]) {
                          return k1 = 'F';
                        }

                        if (temp1 == tempertures[2]) {
                          return k1 = 'K';
                        }
                      });
                    },
                  ),
                  TextField(
                    controller: celController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(suffixText: k1),
                  )
                ],
              ),
            ),
            SizedBox(width: 50),
            Expanded(
              child: Column(
                children: [
                  DropdownButton(
                    items: tempertures.map((item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    value: temp2,
                    onChanged: (newValue) {
                      setState(() {
                        temp2 = newValue;
                        if (temp2 == tempertures[0]) {
                          return k2 = 'C';
                        }
                        if (temp2 == tempertures[1]) {
                          return k2 = 'F';
                        }

                        if (temp2 == tempertures[2]) {
                          return k2 = 'K';
                        }
                      });
                    },
                  ),
                  TextField(
                    controller: fehController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(suffixText: k2),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
