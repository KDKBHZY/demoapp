import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

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
  var quindex = 0;
  var totalscore = 0;
  void _answerQuestion(int score) {
    totalscore += score;
    setState(() {
      quindex += 1;
    });
  }
  void resetquiz() {

    setState(() {
      quindex  = 0;
     totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question': 'What\'s your favourite color?',
        'answers': [
          {'text': 'blue', 'score': 10},
          {'text': 'black', 'score': 10},
          {'text': 'white', 'score': 10}
        ]
      },
      {
        'question': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Snake', 'score': 5},
          {'text': 'rabbit', 'score': 6},
          {'text': 'tiger', 'score': 7}
        ],
      },
      {
        'question': 'Who\'s your favourite NBA Player?',
        'answers': [
          {'text': 'Kobe Bryant', 'score': 20},
          {'text': 'Kevin Durant', 'score': 15},
          {'text': 'Stephen Curry', 'score': 10}
        ],
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: quindex < questions.length
          ? Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Question(
                    questions[quindex]['question'] as String,
                  ),
                  ...(questions[quindex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => _answerQuestion(answer['score'] as int),
                        answer['text'] as String);
                  }).toList(),
                ],
              ),
            )
          : Center(
              child: Column(
                children: [
                  Text(
                    'Total score: $totalscore',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: resetquiz, child: Text('Restart')),
                ],
              ),

            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
