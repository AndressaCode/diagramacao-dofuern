import 'package:flutter/material.dart';
import 'package:no_newspaper_oficial/docsfeitos.dart';

class AdRefs extends StatefulWidget {
  @override
  _AdRefsState createState() => _AdRefsState();
}

class _AdRefsState extends State<AdRefs> {

  var selectedType;

  //final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _docType = <String>[
    'Ad Referendum 02/02/2020',
    'Ad Referendum 05/02/2020',
    'Ad Referendum 08/02/2020',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.height * 6,
            height: 80.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF226CB7),
                  Color(0xFF1B3B97),
                ],
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(120.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Bem vindo", style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white),
                ),
                Text("usuário", style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0),
          Text("Ad Referendum", style: TextStyle(fontSize: 22.0,color: Color(0xFF1B3B97))),
          SizedBox(height: 60.0),
          Container(
            height: 380.0,
            width: 480.0,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0),
                Icon(Icons.find_in_page, size: 120.0, color: Color(0xFF1B3B97)),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                    // Ad Referendum
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
                    hint: Text("Exibir ad referendum", style: TextStyle(fontSize: 16.0, color: Color(0xFF1B3B97)),),
                  ),
                ),
                SizedBox(height: 20.0),
                Text("Escolha um ad referendum acima para visualizar", style: TextStyle(fontSize: 13.0, color: Color(0xFF1B3B97), fontStyle: FontStyle.italic),),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton.icon(
                  color: Color(0xFF1B3B97),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DocsFeitos(),
                        ));
                  },
                  icon: Icon(Icons.navigate_before, color: Colors.white,),
                  label: Text("Voltar", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton.icon(onPressed: () {},
                    color: Color(0xFF1B3B97),
                    icon: Icon(Icons.exit_to_app, color: Colors.white,),
                    label: Text("Sair", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),)),
              )
            ],
          )
        ],
      ),
    );
  }
}
