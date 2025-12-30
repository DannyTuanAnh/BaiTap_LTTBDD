import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Button Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<String>(
              title: Text('Option 1'),
              value: 'option1',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Option 2'),
              value: 'option2',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Option 3'),
              value: 'option3',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedOption != null
                  ? () {
                      // Handle button press when an option is selected
                    }
                  : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
