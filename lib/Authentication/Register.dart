import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wawchan/Shared/TextField.dart';
import 'package:wawchan/Shared/buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String password = '';
  String email = '';
  String username = '';
  String gpassword = '';
  bool passwordVisible = false;

  _signUp(String username, String password) async {
    if (_formkey.currentState.validate()) {
      Map<String, String> dets = {
        'username': username,
        'password': password,
        'email': email
      };
      //var jsonData = null;
      SharedPreferences _shared = await SharedPreferences.getInstance();
      final response = await http.post(
          'http://whatsawhizzerwebnovels.com//wp-json/v2/app/sign_up',
          headers: {'Accept': 'application/json'},
          body: dets);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          _shared.setString('token', jsonData['token']);
        });
        Navigator.pushNamedAndRemoveUntil(context, 'Payment', (_) => false);
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              'Invalid Datails. Please provide the same details used for payment'),
          duration: Duration(seconds: 4),
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
      key: _scaffoldKey,
      backgroundColor: Color(0xff02541B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
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
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
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
                                email = val;
                              },
                              validator: (val) {
                                return val.isEmpty ? 'Enter email' : null;
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
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Email Address'),
                              onChanged: (val) {
                                email = val;
                              },
                              validator: (val) {
                                return val.isEmpty ? 'Enter Password' : null;
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
                                return val.isEmpty
                                    ? 'Enter Confirm Password'
                                    : null;
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
                                labelText: 'Confirm Password',
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
                                gpassword = val;
                              },
                              validator: (val) {
                                return val.isEmpty ? 'Enter email' : null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                InkWell(
                    onTap: () {
                      _signUp(username, password);
                    },
                    child: bigButton(context, 'Register')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a Member?',
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.lightGreenAccent[400]),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('Login');
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
