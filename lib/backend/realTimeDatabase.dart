// Arqui reservado para funções de acesso a o realtime Database.

import 'dart:html';

import 'package:http/http.dart' as rt;
import 'dart:convert';
import 'classPODO.dart';

class StoreInfo{

  String path = "https://jouern-161bf.firebaseio.com/";


  Future<String> buscar() async {

    rt.Response response;
    response = await rt.get(this.path+"Usuarios/User_x/Edicao_x/Portarias/Portaria_1.json");
    print(response.body);

    Map<dynamic, dynamic> retorno = json.decode( response.body );
    print(retorno["IdDocumento"]);
    String id = retorno["IdDocumento"];
    return id;
  }

  Future<bool> novoDoc(String apelido, String id, String data, String user, String edicao, String tipoDoc) async {

    String body = jsonEncode({
      'Apelido' : apelido,
      'IdDocumento' : id,
      'Data' : data
    });

    try{
      rt.Response response = await rt.post(
          this.path+"Usuarios/"+ user +"/"+ edicao +"/"+ tipoDoc +".json",
          headers: {
            "content-type": "aplication/json; charset=UTF-8"
          },
          body: body
      );

      // adcionar referencia Adm
      body = jsonEncode({
        'Apelido' : "Sem nome",
        'IdDocumento' : id,
        'Data' : data
      });

      response = await rt.post(
          this.path+"EdicaoAtual/"+ edicao +"/"+ tipoDoc +".json",
          headers: {
            "content-type": "aplication/json; charset=UTF-8"
          },
          body: body
      );
      return true;
    }catch(error){
      print("Erro_rt: Erro ao inserir arquivo realtime. (" +error +")");
      return false;
    }
  }

  Future<List<Documento>> docsPortipo(String tipoDocs, String user, String edicao) async {
    rt.Response response = await rt.get(
        this.path+"Usuarios/"+ user +"/"+ edicao +"/"+ tipoDocs +".json");

    if(response.statusCode == 200){
      List<Documento> list = List();
      Map<String, dynamic> data = json.decode(response.body);
      List<String> keys = new List();

      for(var k in data.keys){
        keys.add(k);
      }

      int i = 0;
      for( var doc in data.values){

        Documento novo = new Documento(keys[i], doc["Apelido"], doc["Data"], doc["IdDocumento"]);
        list.add(novo);
        i++;

      }

      return list;
    }

    return null;
  }

  Future<bool> editarDoc(Documento doc, String user, String edicao, String tipoDoc) async {

    try{
      String body = jsonEncode({
        'Apelido' : doc.apelido,
        'IdDocumento' : doc.id,
        'Data' : doc.data
      });

      rt.Response response = await rt.put(
          this.path+"Usuarios/"+ user +"/"+ edicao +"/"+ tipoDoc +"/"+ doc.idRealtime +".json",
          headers: {
            "content-type": "aplication/json; charset=UTF-8"
          },
          body: body
      );
      return true;
    }catch(erro){
      print("Erro realtime:"+ erro.toString());
      return false;
    }
  }

  Future<List<Documento>> docsPortipoAdm(String tipoDocs, String edicao) async {
    rt.Response response = await rt.get(
        this.path+"EdicaoAtual/"+ edicao +"/"+ tipoDocs +".json");

    if(response.statusCode == 200){
      List<Documento> list = List();
      Map<String, dynamic> data = json.decode(response.body);
      List<String> keys = new List();

      for(var k in data.keys){
        keys.add(k);
      }

      int i = 0;
      for( var doc in data.values){
        Documento novo = new Documento(keys[i], doc["Apelido"], doc["Data"], doc["IdDocumento"]);
        list.add(novo);
      }

      return list;
    }
  }
}