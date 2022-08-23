import 'package:flutter/material.dart';
import 'question.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
var quindex = 0;
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void answerQuestion(){
    setState(() {
      quindex+=1;
      print('Yes');
    });

  }
  @override
  Widget build(BuildContext context) {
   var questions = ['What\'s your favourite color?', 'What\'s your favourite animal?'];
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:   <Widget>[
            Question(
              questions[quindex],
            ),
            ElevatedButton(onPressed:answerQuestion,
            child: const Text('Answer1')),
            ElevatedButton(onPressed:(){
              print(':'+quindex.toString());
              print('clicked');
            },
                child: const Text('Answer2')),
            ElevatedButton(onPressed:null,
                child: Text('Answer3')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

