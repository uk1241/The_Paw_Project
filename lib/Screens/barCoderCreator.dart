import 'package:flutter/material.dart';
import 'package:myapp/Screens/Scanner.dart';
import 'package:myapp/Screens/barCodeScanner.dart';
import 'package:myapp/main.dart';
import 'package:myapp/sign-in-sign-up/userdata.dart';
import 'package:qr_flutter/qr_flutter.dart';

class barCodeCreate extends StatefulWidget {
  @override
  _barCodeCreateState createState() => _barCodeCreateState();
}

class _barCodeCreateState extends State<barCodeCreate> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8c897f), // Set the app bar background color
        title: Row(
          children: [
            Image.network(
              // Load the logo from a URL
              'https://c8.alamy.com/comp/2BE8T97/veterinary-logo-design-on-pets-animal-pet-logo-cat-and-dog-vector-illustration-2BE8T97.jpg',
              height: 30,
            ),
            SizedBox(width: 10),
            Text('Paw Project'), // Set the app bar title
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: title,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Add comment',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    
                  ),
                ),
              ),
             SizedBox(height: 20),
Container(
         width: MediaQuery.of(context).size.width * 0.8,
        child: MaterialButton(
           color: Color(0xff8c897f),
           onPressed: () {
           // Perform comment addition logic here
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
               content: Text('Comment added successfully!'),
              duration: Duration(seconds: 2),
        ),
      );
    },
            child: Text(
             "Add Comment",
              style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: MaterialButton(
                  color: Color(0xff8c897f),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HospitalPage()),
                    );
                  },
                  child: Text(
                    "Created List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: MaterialButton(
                  color: Color(0xff8c897f),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QrGeneratorPage()),
                    );
                  },
                  child: Text(
                    "Scanner",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "The Paw Project & Co",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
