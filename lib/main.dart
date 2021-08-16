import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'OOOOOOOOOLALA',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.grey,
        middle:  Text('Olala'),
      ),
        child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text("He'd have you all unravel at the"),
          color: Colors.teal[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.teal[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _tabs = [
    AccountTab(),
    AddPhotoTab(),
    MenuTab(),
    SettingTab()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.indigoAccent,
      tabBar: CupertinoTabBar(
        activeColor: Colors.deepPurple,
        backgroundColor: Colors.grey,
        inactiveColor: Colors.deepPurpleAccent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined), label: 'Add Photo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Setting')
        ],
      ),
      tabBuilder: (BuildContext context, index) {
        return _tabs[index];
      },
    );
  }
}

// class Picker extends MenuTab {}

class MenuTab extends StatelessWidget {
  late int selectedValue = 7;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      // padding: EdgeInsets.all(2.0),
      // margin: EdgeInsets.all(2.0),
      alignment: Alignment.topCenter,
      child: CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (value) {
            setState() {
              selectedValue = value;
            }
          },
          scrollController: null,
          children: const [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6'),
            Text('7'),
          ]),
    );
  }
}

class AccountTab extends StatelessWidget {
  String a = 'GO';
  var arr = [];

  void change() async {
    a = 'GONE';
    for (int i = 0; i < 5; i++) {
      arr.add('$i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.bottomCenter,
      width: 200,
      height: 150,
      color: Colors.black,
      child: CupertinoButton(
          alignment: Alignment.center,
          // color: Colors.white,
          child: Text(a),
          padding: EdgeInsets.all(2.0),
          onPressed: () {
            change;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Account()));
          }),
    ));
  }
}

class AddPhotoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('AddPhotoTab'),
    );
  }
}

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Tab'),
    );
  }
}
