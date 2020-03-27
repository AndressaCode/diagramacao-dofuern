import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/admpage.dart';



class EdicaoAberta extends StatefulWidget {
  @override
  _EdicaoAbertaState createState() => _EdicaoAbertaState();
}

class _EdicaoAbertaState extends State<EdicaoAberta> {

  var selectedType1;
  var selectedType2;

  List<String> _tiposDocumentos1 = <String>[
    'Portarias',
    'Resolucoes',
    'Ad Referenduns'
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Edicao",textAlign: TextAlign.right,style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                ),
                ),
                Text('aberta',textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.grey[200],
              ),
              margin: EdgeInsets.all(10.0),
              //color: Colors.grey[300],
              width: 480.0,
              height: 380.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Icon(Icons.assignment, size: 120.0, color: Color(0xff1C1452)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container( // Show documents dropdown button
                        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                        padding: EdgeInsets.all(10.0),
                        child: DropdownButton(
                          items: _tiposDocumentos1
                              .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(color: Color(0xff1C1452)),
                            ),
                            value: value,
                          ))
                              .toList(),
                          onChanged: (selectedTiposDocumentos1) {
                            print('$selectedType1');
                            setState(() {
                              selectedType1 = selectedTiposDocumentos1;
                            });
                          },
                          value: selectedType1,
                          isExpanded: false,
                          hint: Text(
                            'Mostrar documentos',
                            style: TextStyle(color: Color(0xff1C1452)),
                          ),
                        ),
                      ),
                      Container( // Exit button
                        padding: EdgeInsets.all(22.0),
                        child: RaisedButton.icon(
                          onPressed: (){},
                          color: Color(0xff1C1452),
                          icon: Icon(Icons.check, color: Colors.white),
                          label: Text("Ok", style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  RaisedButton.icon(
                    onPressed: (){},
                    color: Colors.grey[100],
                    icon: Icon(Icons.description, color: Color(0xff1C1452),),
                    label: Text("Preview", style: TextStyle(
                        color: Color(0xff1C1452),
                        fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row( // Exit and go back buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( // Go back button
                padding: EdgeInsets.all(22.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => AdminPage(),
                      ),
                    );
                  },
                  color: Color(0xff1C1452),
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                  label: Text( "Voltar",
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ),
              Container( // Alert button
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                padding: EdgeInsets.all(10.0),
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.report_problem),
                  color: Colors.amber,
                  label: Text('Alerta', style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
