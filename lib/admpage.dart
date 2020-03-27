import 'package:flutter/material.dart';
//import 'package:no_newspaper_oficial/errorpage.dart';
//import 'package:no_newspaper_oficial/userpage.dart';
import 'package:no_newspaper_oficial/edicaoaberta.dart';
//import 'package:no_newspaper_oficial/registeruser.dart';
import 'package:no_newspaper_oficial/loginpage.dart';
import 'package:no_newspaper_oficial/main.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var selectedType;

  //final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _docType = <String>[
    'Edição 02 / 01 / 2020',
    'Edição 05 / 03 / 2020',
    'Edição 05 / 05 / 2020',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.height * 6,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF171E76),
                  Color(0xFF1C1452),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Bem Vindo,",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  'Administrador',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text("O que deseja fazer?",
              style: TextStyle(fontSize: 26.0, color: Color(0xff1C1452))),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 40.0),
              Icon(Icons.supervisor_account,
                  size: 120.0, color: Color(0xff1C1452)),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EdicaoAberta(),
                      ));
                },
                color: Colors.grey[600],
                child: Text('Edicao aberta',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)),
              ),
              DropdownButton(
                // closed edition
                items: _docType
                    .map((value) => DropdownMenuItem(
                  child: Text(
                    value,
                    style: TextStyle(color: Color(0xff1C1452)),
                  ),
                  value: value,
                ))
                    .toList(),
                onChanged: (selectedDocType) {
                  print('$selectedDocType');
                  setState(() {
                    selectedType = selectedType;
                  });
                  setState(() {
                    selectedType = selectedDocType;
                  });
                },
                value: selectedType,
                isExpanded: false,
                hint: Text(
                  'Edições fechadas',
                  style: TextStyle(color: Color(0xff1C1452)),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //Settings button
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Color(0xff1C1452)),
                  label: Text("Configurações",
                      style: TextStyle(fontSize: 15.0, color: Color(0xff1C1452))),
                  color: Colors.grey[100],
                ),
              ),
              Container(
                // Ok Button
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.check, color: Color(0xff1C1452)),
                  label: Text('Ok',
                      style: TextStyle(fontSize: 15.0, color: Color(0xff1C1452))),
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Row( // Exit and go back buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( // Go back button
                padding: EdgeInsets.all(22.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  color: Color(0xff1C1452),
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Voltar",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
              Container( // Exit button
                padding: EdgeInsets.all(22.0),
                child: RaisedButton.icon(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  color: Color(0xff1C1452),
                  icon: Icon(Icons.exit_to_app, color: Colors.white),
                  label: Text("Sair", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
