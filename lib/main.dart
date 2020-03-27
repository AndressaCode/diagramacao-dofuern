import 'dart:html';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_newspaper_oficial/admpage.dart';
import 'package:no_newspaper_oficial/backend/noAPI.dart';
import 'package:no_newspaper_oficial/loginpage.dart';
import 'package:no_newspaper_oficial/userpage.dart';
import 'package:no_newspaper_oficial/errorpage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

import 'backend/classPODO.dart';
//import 'backend/firebaseConect.dart';

//BaseDo firebs;

void main() async {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NO - Newspaper Oficial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(title: 'NO - Newspaper Oficial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _senha = new TextEditingController();
  final _user = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height * 4,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF226CB7),
                  Color(0xFF1C1452),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.description, size: 65, color: Colors.white),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "NO",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  'Newpaper Oficial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.height * 0.4,
            height: 320,
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    controller: _user,
                    style:
                    new TextStyle(color: Colors.deepPurple, fontSize: 22),
                    decoration: InputDecoration(
                      labelText: "Matricula",
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    controller: _senha,
                    style:
                    new TextStyle(color: Colors.deepPurple, fontSize: 22),
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        RegExp validUser = new RegExp(r"[0-9]");
                        RegExp validSenha = new RegExp(r"[0-9]");
                        Iterable<Match> match1 =
                        validSenha.allMatches(_user.text);
                        Iterable<Match> match2 =
                        validUser.allMatches(_senha.text);
                        if (match1.length == 0 || match2.length == 0) {
                          Alert(
                            context: context,
                            title: "Matricula/Senha não foi informada",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ).show();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        }
                      },
                      color: Color(0xFF226CB7),
                      child: Text(
                        "Logar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
