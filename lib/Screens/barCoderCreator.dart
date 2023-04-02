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
  // File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(35),
              ),
              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Add comment ',
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Color(0xff8c897f),
                onPressed: () {
                  // setState(() {
                  //   code = title.text;
                  // });
                },
                child: Text(
                  "Add Comment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),


              //button2 
               MaterialButton(
                color: Color(0xff8c897f),
                onPressed: () {
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HospitalPage()),
);

                },
                child: Text(
                  "created list",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),




              //button 3
               MaterialButton(
                color: Color(0xff8c897f),
                onPressed: () {
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => QrGeneratorPage()),
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
              // code == ''
              //     ? Text('')
              //     : BarcodeWidget(
              //   barcode: Barcode.qrCode(
              //     errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              //   ),
              //   data: '$code',
              //   width: 200,
              //   height: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
