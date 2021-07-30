import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Widget>_tabs = [
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
            BottomNavigationBarItem(
                icon: Icon(Icons.build), label: 'Setting')
      ],
    ),
    tabBuilder: (BuildContext context, index){
          return _tabs[index];
    },
    );
  }
}

class Picker extends MenuTab {

}

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
        onSelectedItemChanged: (value){setState(){selectedValue = value;}},
        scrollController: null,
        children: const[
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

  void textChange() async {
     a = 'GONE';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:      Container(
      alignment: Alignment.topCenter,
      width: 400,
      height: 150,
      color: Colors.white10,
      child: CupertinoButton(
          alignment: Alignment.topCenter,
          child: Text(a),
          onPressed: textChange),
      // Text('Account Tab'),
    ),
    );
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
