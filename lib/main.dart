import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masha APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<TaskCard> taskList = [];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  AnimationController? _controller;
  Animation<Offset>? _myAnimation;

  @override
  void initState() {
    super.initState();

    createList();
    if(taskList != []){
      print('go');
      loadTasks();
    }

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _myAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(15, 0),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOutBack,
    ));
  }

  void createList(){
    for(var i = 0; i < 3; i++){
      taskList.add(TaskCard.construct(isDone: false, isArchived: false, title: 'title is $i', id: i));
    }
  }

  void loadTasks(){
    taskList.forEach((element) {
      _key.currentState?.insertItem(element.id);
    });
  }

  void _onChanged(int index) {
    setState(() {
      TaskCard a = taskList[index].edit(isDone: !taskList[index].isDone);
      _removeItem(index);
      _addItem();
      taskList[0] = a;
    });
  }

  void _addItem() {
    taskList.insert(
        0,
        TaskCard.construct(
            isDone: false,
            isArchived: false,
            title: 'title ${taskList.length}',
            id: taskList.length + 1));
    _key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 500));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.grey,
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
          ),
        ),
      );
      ;
    }, duration: const Duration(milliseconds: 500));

    taskList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            // key: _key,
            icon: const Icon(Icons.add_alert),
            tooltip: 'add',
            onPressed: () {
              _addItem();
            },
          ),
          IconButton(
            // key: _key,
            icon: const Icon(Icons.delete_forever),
            tooltip: 'del',
            onPressed: () {},
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: taskList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (_, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.indigoAccent,
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Checkbox(
                  value: taskList[index].isDone,
                  onChanged: (_) {
                    _onChanged(index);
                  },
                ),
                title: Text(taskList[index].title,
                    style: const TextStyle(fontSize: 24)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _removeItem(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TaskCard {
  final bool isDone;
  final bool isArchived;
  final String title;
  final int id;

  TaskCard.construct({
    required this.isDone,
    required this.isArchived,
    required this.title,
    required this.id,
  });

  TaskCard edit({isDone, isArchived, title, id}) {
    return TaskCard.construct(
        isDone: isDone ?? this.isDone,
        isArchived: isArchived ?? this.isArchived,
        title: title ?? this.title,
        id: id ?? this.id);
  }
}
