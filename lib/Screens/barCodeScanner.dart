import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorPage extends StatefulWidget {
  @override
  _QrGeneratorPageState createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGeneratorPage> {
  TextEditingController _textEditingController = TextEditingController();
  String _qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter the data',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _textEditingController.text;
                });
              },
              child: Text('Generate QR'),
            ),
            SizedBox(height: 20.0),
            if (_qrData.isNotEmpty) QrImage(data: _qrData),
          ],
        ),
      ),
    );
  }
}

