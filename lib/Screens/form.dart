import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myFocus;
  @override
  void initState() {
    super.initState();
    myFocus = FocusNode();
    myControlar.addListener(setLatest);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocus.dispose();
  }

  final formKey = GlobalKey();

  String text = '';
  final myControlar = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  // }
  setLatest() {
    setState(() {
      text = myControlar.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'you type $text',
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "invalid data";
                    }
                    return null;
                  },
                  autofocus: true,
                  controller: myControlar,
                  // onChanged: (value) {
                  //   setState(() {
                  //     text = value;
                  //   });
                  // },

                  decoration: InputDecoration(
                    hintText: 'first name',
                  ),
                ),
                TextFormField(
                  focusNode: myFocus,
                  decoration: InputDecoration(hintText: 'sec name'),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('next'),
        onPressed: () => myFocus.requestFocus(),
      ),
    );
  }
}
