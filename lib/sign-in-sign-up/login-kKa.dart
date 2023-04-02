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
    // ignore: sized_box_for_whitespace
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // loginov8 (995:3011)
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // signupmVa (995:3019)
                margin:
                    EdgeInsets.fromLTRB(12.5 * fem, 0 * fem, 0 * fem, 75 * fem),
                child: Text(
                  'The Paw Project',
                  style: SafeGoogleFont(
                    'Franklin Gothic Medium Cond',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 0.7333333333 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // margin:
                //     EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 16 * fem),
                // padding: EdgeInsets.fromLTRB(
                //     18.5 * fem, 15 * fem, 18.5 * fem, 12 * fem),
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffdee1e3),
                  borderRadius: BorderRadius.circular(4 * fem),
                ),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    labelText: ' Type Your Email',
                    labelStyle: SafeGoogleFont(
                      'Outfit',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8c897f),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 115 * fem),
                padding: EdgeInsets.fromLTRB(
                    18.5 * fem, 15 * fem, 18.5 * fem, 12 * fem),
                width: double.infinity,
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
                      // height: 1.26*ffem/fem,
                      color: Color(0xff8c897f),
                    ),
                  ),
                ),
              ),
              Container(
                // frame661we (995:3013)
                // margin:
                //     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14.5 * fem, 16 * fem),
                // width: 300 * fem,
                // height: 42 * fem,
                decoration: BoxDecoration(
                  color: Color(0xff225b99),
                  borderRadius: BorderRadius.circular(8 * fem),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      User? user = await loginUsingEmailPassword(
                          email: _emailcontroller.text,
                          password: _passwordcontroller.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => barCodeCreate()),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff225b99),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),

                      child: Text('SIGN IN'),
                      // ),
                    ),
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
