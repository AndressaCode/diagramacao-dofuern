import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/userpage.dart';
import 'package:no_newspaper_oficial/main.dart';

// Esqueleto de toda página comum a usuário

class NewDoc extends StatefulWidget {
  @override
  _NewDocState createState() => _NewDocState();
}

class _NewDocState extends State<NewDoc> {

  var selectedType;

  //final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _docType = <String>[
    'Portaria',
    'Ad Referendum',
    'Resoluções',
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
                  Color(0xFF226CB7),
                  Color(0xFF1B3B97),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Bem vindo,",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontFamily: 'Roboto'),
                ),
                Text(
                  "Usuário",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ), // Final do esqueleto de toda página
          SizedBox(height: 60.0),
          Text(
            "Novo documento",
            style: TextStyle(fontSize: 22.0, color: Color(0xFF1B3B97)),
          ),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      Text("Edição aberta: XX / XX / 2020", style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF1B3B97),
                      ),
                      ),
                      SizedBox(height: 60.0),
                      Text("Disponivel ate: XX / XX / 2020", style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF1B3B97),
                      ),
                      ),
                      SizedBox(height: 50.0),
                      DropdownButton(
                        // closed edition
                        items: _docType
                            .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Color(0xFF1B3B97)),
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
                          "Tipo de documento",
                          style: TextStyle(color: Color(0xFF1B3B97)),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Text("Escolha um tipo de documento para continuar", style: TextStyle(
                        color: Color(0xFF1B3B97),
                        fontSize: 13.0,
                        fontStyle: FontStyle.italic,
                      ),),
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
                            builder: (context) => UserPage(),
                          ),
                        );
                      },
                      color: Color(0xFF1B3B97),
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                      ),
                      label: Text( "Voltar",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white)),
                    ),
                  ),
                  Container( // Exit button
                    padding: EdgeInsets.all(22.0),
                    child: RaisedButton.icon(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ));
                      },
                      color: Color(0xFF1B3B97),
                      icon: Icon(Icons.exit_to_app, color: Colors.white),
                      label: Text("Sair", style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
