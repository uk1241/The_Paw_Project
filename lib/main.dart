import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/barCoderCreator.dart';
import 'package:myapp/sign-in-sign-up/login.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/sign-in-sign-up/login-kKa.dart';


Future<void> main()  async {
   WidgetsFlutterBinding.ensureInitialized();
 // Added this line
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return NewWidget(widget: widget);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key, // Added Key? here
    required this.widget,
  }) : super(key: key);

  final MyApp widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: widget._initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return barCodeCreate();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        // Removed child property from Scaffold
      ),
    );
  }
}
