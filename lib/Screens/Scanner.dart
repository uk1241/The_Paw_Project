// import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/services.dart';

// class BarcodeScannerPage extends StatefulWidget {
//   @override
//   _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
// }

// class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
//   String _barcode = "";

//   Future<void> _scanBarcode() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       setState(() => _barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           _barcode = 'The user did not grant the camera permission!';
//         });
//       } else {
//         setState(() => _barcode = 'Unknown error: $e');
//       }
//     } on FormatException {
//       setState(() => _barcode = 'The user returned to the scanner without scanning any code.');
//     } catch (e) {
//       setState(() => _barcode = 'Unknown error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Barcode Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_barcode.isNotEmpty)
//               Text(
//                 'Barcode Result: $_barcode',
//                 style: TextStyle(fontSize: 18),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text('Scan Barcode'),
//               onPressed: _scanBarcode,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
