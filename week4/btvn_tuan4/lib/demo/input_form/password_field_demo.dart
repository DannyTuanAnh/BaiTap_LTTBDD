import 'package:flutter/material.dart';

class PasswordFieldDemo extends StatefulWidget {
  const PasswordFieldDemo({super.key});

  @override
  State<PasswordFieldDemo> createState() => _PasswordFieldDemoState();
}

class _PasswordFieldDemoState extends State<PasswordFieldDemo> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Input Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Password: \'${_controller.text}\'')),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
