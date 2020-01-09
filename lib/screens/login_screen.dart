import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/constant/text_constant.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/sevices/user_service.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  static const ROUTE_NAME = "login";
  String username;
  String password;
  http.Response response;
  UserService userService;


  LoginScreen(this.userService);

  @override
  Widget build(BuildContext context) {
    print("mashok login");
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 120),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                TextConstant.APP_TEXT,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: "Demode",
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.blue,
                      blurRadius: 10.0,
                      offset: Offset(5.0, 5.0),
                    ),
                    Shadow(
                      color: Colors.red,
                      blurRadius: 10.0,
                      offset: Offset(-5.0, 5.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 77.0),
                  children: <Widget>[
                    TextField(
                      onChanged: (text)=>username = text,
                      style: TextStyle(color: Colors.grey),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.pink,
                        ),
                        labelText: 'username',
                        labelStyle: TextStyle(color: Colors.pink),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        onChanged: (text)=>password = text,
                        obscureText: true,
                        style: TextStyle(color: Colors.grey),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.pink,
                          ),
                          labelText: 'password',
                          labelStyle: TextStyle(color: Colors.pink),
                          contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () async {
                          Map credential = {"username":username, "password": password};
                          print(credential);
                          print(jsonEncode(credential));
                          response = await userService.fetchLogin(credential);
                          if(response.statusCode==200){
                            print("login success");
                            Navigator.popAndPushNamed(context, HomeScreen.ROUTE_NAME);
                          }else{
                            final snake = SnackBar(
                              content: Text('Loging Failed'),
                              backgroundColor: Colors.white,
                              duration: Duration(seconds: 3),
                            );
                            Scaffold.of(context).showSnackBar(snake);
                            print(response.body);
                          }
                        },
                        padding: EdgeInsets.all(12),
                        color: Color(0xffC70039),
                        child: Text('Log In', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffC70039)
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () async {
                          response = await userService.fetchLogout();
                          print(response.statusCode);
                          print(response.body);
                        },
                        color: Colors.transparent,
                        padding: EdgeInsets.all(12),
                        child: Text('Create Account', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
