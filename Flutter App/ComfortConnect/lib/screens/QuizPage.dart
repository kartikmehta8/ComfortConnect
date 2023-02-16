import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkspace/screens/fileupload.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List of questions and their answers
  List<Map<String, Object>> _questions = [
    {
      'question': 'I am able to manage my schedule well?',
      'answers': [
        {'text': 'Always', 'isCorrect': false},
        {'text': 'Never', 'isCorrect': true},
        {'text': 'Mostly', 'isCorrect': false},
        {'text': 'Rarely', 'isCorrect': false},
      ],
    },
    {
      'question': 'I am able to handle difficult situtaions?',
      'answers': [
        {'text': 'Always', 'isCorrect': false},
        {'text': 'Never', 'isCorrect': true},
        {'text': 'Mostly', 'isCorrect': false},
        {'text': 'Rarely', 'isCorrect': false},
      ],
    },
    {
      'question': 'I would love to take a break from everything?',
      'answers': [
        {'text': 'Always', 'isCorrect': false},
        {'text': 'Never', 'isCorrect': true},
        {'text': 'Mostly', 'isCorrect': false},
        {'text': 'Rarely', 'isCorrect': false},
      ],
    },
    {
      'question':
          'I feel that my talents are not recognized well enough in my college//class??',
      'answers': [
        {'text': 'Always', 'isCorrect': false},
        {'text': 'Never', 'isCorrect': true},
        {'text': 'Mostly', 'isCorrect': false},
        {'text': 'Rarely', 'isCorrect': false},
      ],
    },
    {
      'question': 'I lose my calm with my peers or my family',
      'answers': [
        {'text': 'Always', 'isCorrect': false},
        {'text': 'Never', 'isCorrect': true},
        {'text': 'Mostly', 'isCorrect': false},
        {'text': 'Rarely', 'isCorrect': false},
      ],
    },
  ];

  // Index of the current question
  int _currentQuestionIndex = 0;

  // Called when an answer is selected
  void _selectAnswer(bool isCorrect) {
    // Show a message indicating if the answer is correct or not
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Great!!! Keep it up!',
            style: GoogleFonts.balsamiqSans(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Move on to the next question
                setState(() {
                  _currentQuestionIndex++;
                  if (_currentQuestionIndex == _questions.length) {
                    _currentQuestionIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FileUpload()),
                    );
                  }
                });
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: GoogleFonts.balsamiqSans(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _questions[_currentQuestionIndex]['question'].toString(),
                style: GoogleFonts.balsamiqSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ...(_questions[_currentQuestionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
                  (answer) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () => _selectAnswer(
                          answer['isCorrect'].toString() == 'true'),
                      child: Text(answer['text'].toString()),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
