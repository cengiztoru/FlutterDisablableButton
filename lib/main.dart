import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void setDelay(int second, Function afterDelay) {
    Future.delayed(Duration(seconds: second), () {
      afterDelay();
    });
  }

  void _saveUser() {
    print("Button Pressed");
    setState(() {
      _isLoading = true;
    });

    setDelay(
        2,
        () => {
              setState(() {
                _isLoading = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Is Exist Any Loading Process \n \n $_isLoading \n",
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.blue),
              ),
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              onPressed: _isLoading == true ? null : _saveUser,
              // : () => {print("Button Pressed"), isLoading = true},
              child: new Text("SignUp User"),
            )
          ],
        ),
      ),
    );
  }
}
