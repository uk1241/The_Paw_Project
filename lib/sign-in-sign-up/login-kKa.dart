import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/barCoderCreator.dart';
import 'package:myapp/utils.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseOptions options = FirebaseOptions(
    appId: 'your_app_id',
    apiKey: 'your_api_key',
    projectId: 'your_project_id',
    messagingSenderId: 'your_messaging_sender_id',
  );

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  //textediting controller
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  //LoginFunction
  Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    var baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 75 * fem),
                Text(
                  'The Paw Project',
                  style: SafeGoogleFont(
                    'Franklin Gothic Medium Cond',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 0.7333333333 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(height: 32 * fem),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffdee1e3),
                    borderRadius: BorderRadius.circular(4 * fem),
                  ),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Type Your Email',
                      labelStyle: SafeGoogleFont(
                        'Outfit',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8c897f),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(
                        18.5 * fem,
                        15 * fem,
                        18.5 * fem,
                        12 * fem,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16 * fem),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffdee1e3),
                    borderRadius: BorderRadius.circular(4 * fem),
                  ),
                  child: TextField(
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      labelText: 'Type Your Password',
                      labelStyle: SafeGoogleFont(
                        'Outfit',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8c897f),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(
                        18.5 * fem,
                        15 * fem,
                        18.5 * fem,
                        12 * fem,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 115 * fem),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => barCodeCreate()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 42 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff225b99),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
