import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/portarias.dart';
import 'package:no_newspaper_oficial/resolucoes.dart';
import 'package:no_newspaper_oficial/adrefs.dart';
import 'package:no_newspaper_oficial/userpage.dart';

class DocsFeitos extends StatefulWidget {
  @override
  _DocsFeitosState createState() => _DocsFeitosState();
}

class _DocsFeitosState extends State<DocsFeitos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                Text("Bem vindo,", style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'Roboto'),
                ),
                Text("Usuário", style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: 'Roboto'),
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0,),
          Text("Documentos feitos", style: TextStyle(fontSize: 22.0, color: Color(0xFF1B3B97)),),
          SizedBox(height: 60.0),
          Center(
            child: Container(
              width: 480.0,
              height: 380.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                color: Colors.grey[200],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: FlatButton(
                          onPressed:(){},
                          color: Colors.grey[600],
                          child: Text("Portaria", style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      RaisedButton(
                        onPressed:(){
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => Portarias(),
                            ),
                          );
                        },
                        color: Color(0xFF1B3B97),
                        child: Text("Ok", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                      ),
                    ],
                  ), // Portaria e botao ok
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 200.0,
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.grey[600],
                          child: Text("Resolução", style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      RaisedButton(
                        color: Color(0xFF1B3B97),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => Resolucao(),
                              ));
                        },
                        child: Text("Ok", style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0,),// Resoluções e botao ok
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: FlatButton(
                          onPressed: (){},
                          color: Colors.grey[600],
                          child: Text("Ad Referendum", style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      RaisedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => AdRefs(),
                              ));
                        },
                        color: Color(0xFF1B3B97),
                        child: Text("Ok", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                      ),
                    ],
                  ), // Ad referendum e botao ok
                ],
              ),
            ),
          ),
          SizedBox(height: 40.0,),
          Row( // Go back and Exit Buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.0),
                child: RaisedButton.icon(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => UserPage(),
                    ),
                  );
                },
                  color: Color(0xFF1B3B97),
                  icon: Icon(Icons.navigate_before, color: Colors.white,),
                  label: Text("Voltar", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: RaisedButton.icon(onPressed: (){},
                  color: Color(0xFF1B3B97),
                  icon: Icon(Icons.exit_to_app, color: Colors.white,),
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
