import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/fake_wellness.dart';
import '../../riverpod/bottom_tab_provider.dart';
import 'fileupload.dart';

class QuizComponent extends StatefulWidget {
  QuizComponent({Key? key}) : super(key: key);

  @override
  State<QuizComponent> createState() => _QuizComponentState();
}

class _QuizComponentState extends State<QuizComponent> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, ref, _) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(mhBottomTabProvider.notifier).state = 0;
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              Text(
                "Cognitive Combat",
                style: GoogleFonts.balsamiqSans(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Answer these questions to get your assesment done",
                  style: GoogleFonts.balsamiqSans(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Your data will be kept confidential and used for improving our recommendations.",
                  style: GoogleFonts.balsamiqSans(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 24),
                //   child: Divider(color: Colors.black),
                // ),
                // const Text("10 Video Content"),
                const SizedBox(height: 16),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _questions[_currentQuestionIndex]['question']
                            .toString(),
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
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
