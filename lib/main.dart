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
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Olala'),
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  child: const Text('Action one'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('Action two'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Text("He'd have you all unravel at the"),
                color: Colors.teal[100],
              ),
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

class MenuTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        middle: Text('4iOs'),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Select someone'),
          ),
          CupertinoButton(
            child: Text('tap'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Picker1()));
            },
          )
        ],
      ),
    );
  }
}

class Picker1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PickerState();
}

class _PickerState extends State<Picker1> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Piskner'),
        ),
        child: CupertinoPicker(
          onSelectedItemChanged: (value) {
            setState(() {
              selectedValue = value;
              print(selectedValue);
            });
          },
          itemExtent: 32.0,
          children: const [
            Text('11'),
            Text('12'),
            Text('13'),
          ],
        ));
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
    return Column(
      children: [
        CupertinoButton(
          borderRadius: BorderRadius.circular(14),
          color: CupertinoColors.tertiaryLabel,
          child: Text(a),
          padding: EdgeInsets.all(2.0),
          onPressed: () {
            change;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Account()));
          },
        )
      ],
    );
  }
}

class AddPhotoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddPhotoTabState();
}
class AddPhotoTabState extends State<AddPhotoTab> {

  List<Color> list_c = [Colors.red,Colors.green];

  String str = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: [
        Container(
          padding: EdgeInsets.all(50),
          child: CupertinoButton(
            color: CupertinoColors.activeOrange,
            onPressed: (){
              setState(() {
                list_c = list_c.reversed.toList();

              });
            },
            child: Text('BUTTOOOOOON'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50),
          color: list_c[0],
          child: Text('1'),
        ),
        Container(
          padding: EdgeInsets.all(50),
          color: list_c[1],
          child: Text('2'),
        )
      ],
    );
  }

  void func(){

    build;
  }

}


class SettingTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {

  void displayDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) =>
      CupertinoAlertDialog(
        title: Text("Alert"),
        content: Text("My alert message"),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true, child: Text("Close"),
              onPressed: (){Navigator.of(context).pop();},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoButton(child: Container(
          color: Colors.grey,
          child: Text('tap'),
        ), onPressed: (){

            displayDialog();
            print('1');

          })
    );
  }

}
