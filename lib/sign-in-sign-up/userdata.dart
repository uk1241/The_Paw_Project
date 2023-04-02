import 'package:flutter/material.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  TextEditingController _controller = TextEditingController();
  List<String> _hospitalNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Names'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter hospital name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _hospitalNames.add(_controller.text);
                  _controller.clear();
                });
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _hospitalNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_hospitalNames[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
