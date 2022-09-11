import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 4;

  late List<int> _list;

  @override
  void initState() {
    _shuffle();
    super.initState();
  }

  void _shuffle() {
    setState(() {
      _list = List<int>.generate(_count, (index) => index + 1)..shuffle();
    });
  }

  void _increase() {
    _count++;
    _shuffle();
  }

  void _decrease() {
    _count--;
    _shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shuffle $_count'),
        actions: [
          IconButton(onPressed: _increase, icon: const Icon(Icons.plus_one)),
          IconButton(
            onPressed: _decrease,
            icon: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(title: Text('#${_list[index]}')),
        itemCount: _count,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        tooltip: 'Shuffle',
        child: const Icon(Icons.shuffle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
