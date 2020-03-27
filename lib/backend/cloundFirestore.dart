// Arquivo resovardo para API de comunicação com o Cound Firestore
import 'dart:async';

import 'package:firebase/firestore.dart';

import 'classPODO.dart';

class StoreDocs {
  // Classe onde são mantidas todas a funções de comunicação com o firestore

  Firestore data;

  StoreDocs(Firestore firebs){
    data = firebs;
  }

  Future<String> novoArquivo(String nome, String titulo, String considerando, String resolve, String tipo) async {
    // Função resonsavel pela criação de novas edições
    // Caso aja sucesso na criação a função return o Id do documento caso não, um valor nulo

    try{
      DocumentReference doc = await this.data.collection(tipo)
          .add(
        {
          'nome' : nome,
          'titulo' : titulo,
          'considerando' : considerando,
          'resolve' : resolve
        },
      );
      return doc.id;
    }catch(erro){
      print("Erro:" + erro.tostring());
      return null;
    }
  }

  Future<Map<String, dynamic>> getDoc(String id, String tipoDoc) async {

    try{
      DocumentSnapshot snapshot = await this.data
          .collection(tipoDoc).doc(id).get();

      Map<String, dynamic> dados = snapshot.data();

      return dados;
    }catch(erro){
      print("Erro Clound Store:" + erro.toString());
      return null;
    }
  }

  Future<bool> editarDoc(DocInfo documento, String tipoDoc, String id) async {

    try{
      this.data.collection(tipoDoc)
          .doc(id).set(
        {
          'nome' : documento.nome,
          'titulo' : documento.titulo,
          'considerando' : documento.considerando,
          'resolve' : documento.resolve
        },
      );
      return true;
    }catch(erro){
      print("Erro clound Store:" + erro.tostring());
      return false;
    }
  }

  /*deletar */
  Future<bool> deletDoc( String tipoDoc, String id) async {
    print("entrou");
    try{
      this.data.collection(tipoDoc)
          .doc(id).delete();
      return true;
    }catch(erro){
      print("Erro clound Store:" + erro.tostring());
      return false;
    }
  }
}
