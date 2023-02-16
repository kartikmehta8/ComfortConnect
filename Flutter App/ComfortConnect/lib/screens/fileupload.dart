import 'package:flutter/material.dart';

class FileUpload extends StatelessWidget {
  const FileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subjective Answers',
          style: TextStyle(color: Colors.grey),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    // icon: Icon(Icons.person),
                    hintText: 'How do you handle excessive workload?',
                    labelText: 'How do you handle excessive workload?',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20)),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
              },
              child: Text('Submit your answers.'),
            ),
          ],
        ),
      ),
    );
  }
}
