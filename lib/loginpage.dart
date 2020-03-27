import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/admpage.dart';
import 'package:no_newspaper_oficial/errorpage.dart';
import 'package:no_newspaper_oficial/userpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.input, size: 65, color: Colors.white),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Mockup Login",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Color(0xFF226CB7),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(22.0),
                  splashColor: Color(0xFF1C1452),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(),
                        ));
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.person),
                      Text("Usuário Simples"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                FlatButton(
                  color: Color(0xFF1C1452),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(22.0),
                  splashColor: Color(0xFF226CB7),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPage(),
                        ));
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.supervisor_account),
                      Text("Administrador"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                FlatButton(
                  color: Color(0xFF226CB7),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(22.0),
                  splashColor: Color(0xFF1C1452),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ErrorPage(),
                        ));
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.do_not_disturb,
                        color: Colors.red,
                      ),
                      Text("Erro de Acesso"),
                    ],
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
