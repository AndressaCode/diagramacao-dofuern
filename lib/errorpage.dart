import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/loginpage.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
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
                Icon(Icons.do_not_disturb, size: 65, color: Colors.red),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Erro de Acesso",
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
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.height * 2,
            height: 200,
            child: Column(
              children: <Widget>[
                Text(
                  "Você não tem permissão para acessar a página ou usou credenciais erradas",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  "Verifique suas credenciais e tente novamente!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton.icon(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  color: Color(0xFF1B3B97),
                  icon: Icon(Icons.navigate_before, color: Colors.white,),
                  label: Text("Voltar", style: TextStyle(fontSize: 16.0, color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
