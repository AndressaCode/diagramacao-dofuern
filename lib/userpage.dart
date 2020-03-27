import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/docsfeitos.dart';
import 'package:no_newspaper_oficial/loginpage.dart';
import 'package:no_newspaper_oficial/main.dart';
import 'package:no_newspaper_oficial/newdoc.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                Text("Bem vindo", textAlign: TextAlign.right, style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Roboto'
                ),
                ),
                Text("Usuário", textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                ),),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text("O que deseja fazer?", style: TextStyle(fontSize: 26.0, color: Color(0xFF1B3B97)),),
          SizedBox(height: 60.0,),
          Icon(Icons.person, size: 120, color: Color(0xFF1B3B97),),
          SizedBox(height: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Novo documento", style: TextStyle(fontSize: 16.0, color: Color(0xFF1B3B97))),
                  SizedBox(width: 17.0),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => NewDoc(),
                          ),
                        );
                      },
                      color: Colors.grey[100],
                      child: Text("Ok", style: TextStyle(fontSize: 16.0, color: Color(0xFF1B3B97)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Documentos feitos", style: TextStyle(fontSize: 16.0, color: Color(0xFF1B3B97))),
                  SizedBox(width: 10.0),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: RaisedButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DocsFeitos(),
                        ) ,
                      );
                    },
                      color: Colors.grey[100],
                      child: Text("Ok", style: TextStyle(fontSize: 16.0, color: Color(0xFF1B3B97)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 60.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(22.0),
                child: RaisedButton.icon(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  color: Color(0xFF1B3B97),
                  icon: Icon(Icons.navigate_before, color: Colors.white,),
                  label: Text("Voltar", style: TextStyle(fontSize: 16.0, color: Colors.white,)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(22.0),
                child: RaisedButton.icon(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  color: Color(0xFF1B3B97),
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
