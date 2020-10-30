import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wawchan/Screens/Home.dart';
import 'package:wawchan/Shared/Progress.dart';
import 'package:wawchan/Shared/TextField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final key = new GlobalKey<ScaffoldState>();
  String password = '';
  String username = '';
  bool passwordVisible = false;

  _login(String username, String password) async {
    if (_formkey.currentState.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Progress(
          status: 'Logging You in',
        ),
      );
      Map<String, String> dets = {'username': username, 'password': password};
      //var jsonData = null;
      SharedPreferences _shared = await SharedPreferences.getInstance();
      final response = await http.post(
          'http://whatsawhizzerwebnovels.com//wp-json/jwt-auth/v1/token',
          headers: {'Accept': 'application/json'},
          body: dets);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          _shared.setString('token', jsonData['token']);
        });
        print(jsonData);
        //Navigator.pushNamedAndRemoveUntil(context, 'Home', (_) => false);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (route) => false);
      } else {
        key.currentState.showSnackBar(new SnackBar(
          content: new Text("Invalid Login Details"),
          duration: Duration(seconds: 3),
        ));
        print(response.body);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Color(0xff02541B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Text(
                            'Please login into your account',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Username'),
                              onChanged: (val) {
                                username = val;
                              },
                              validator: (val) {
                                return val.isEmpty ? 'Enter username' : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              obscureText: passwordVisible,
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choRolee the icon
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey[900],
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              onChanged: (val) {
                                password = val;
                              },
                              validator: (val) {
                                return val.isEmpty ? 'Enter password' : null;
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.green[400]),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                InkWell(
                  onTap: () {
                    _login(username, password);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .08,
                    width: MediaQuery.of(context).size.width * .6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff01C606),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Text(
                  'or login with',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                              child: Text(
                            'I',
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 24),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                              child: Text(
                            'F',
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 24),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User?',
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.lightGreenAccent[400]),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('Register');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
