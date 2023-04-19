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
      backgroundColor: Color(0xff8c897f),
      title: Row(
        children: [
          Image.network(
            'https://c8.alamy.com/comp/2BE8T97/veterinary-logo-design-on-pets-animal-pet-logo-cat-and-dog-vector-illustration-2BE8T97.jpg',
            height: 30,
          ),
          SizedBox(width: 10),
          Text('Paw Project Hospitals'),
        ],
      ),
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
          SizedBox(height: 32.0),
          Container(
            alignment: Alignment.center,
            color:  Colors.white,
            height: 50,
            child: Text(
              'All rights regards to Paw Project',
              style: TextStyle(
                color:Color(0xff8c897f),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}

//  Colors.white