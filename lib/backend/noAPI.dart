import 'cloundFirestore.dart' as api_fs;
import 'realTimeDatabase.dart' as api_rt;
import 'firebaseConect.dart' as api_cn;
import 'classPODO.dart';

api_cn.BaseDo cn = api_cn.BaseDo();
api_fs.StoreDocs fs = new api_fs.StoreDocs(cn.storeDocs);
api_rt.StoreInfo rt = new api_rt.StoreInfo();

// Tipos de arquivos permitidos

Map<int, String> tipoArquivo = {
  1 : 'Portarias',
  2 : 'Resoluções',
  3 : 'AdRefendum',
  4 : 'AtoDeDesignação'
};

// adicionar novo documento

Future<bool> novoDoc(
    String user, String apelido, String titulo, String considerando, String resolver, int tipo, String data, String edicao) async {

  String id =  await fs.novoArquivo("null", titulo, considerando, resolver, tipoArquivo[tipo]);

  if(id == null){
    return false;
  }

  bool res = await rt.novoDoc(apelido, id, data, user, edicao, tipoArquivo[tipo]);

  if(res){
    return true;
  }else{
    return true;
  }
}

Future<List<Documento>> buscarListaDeDocs(int tipoDocs, String user, String edicao) async{

  List<Documento> lista = await rt.docsPortipo(tipoArquivo[tipoDocs], user, edicao);

  return lista;

}

Future<DocInfo> buscarDoc(String id, int tipoDoc) async {

  Map<String, dynamic> dados = await fs.getDoc(id, tipoArquivo[tipoDoc]);

  DocInfo documento = new DocInfo(dados["nome"], dados["titulo"], dados["considerando"], dados["resolve"]);
  return documento;
}

Future<bool> editarDoc(DocInfo documento, Documento docReal, String user, String edicao, int tipoDoc) async {

  bool valor =  await fs.editarDoc(documento, tipoArquivo[tipoDoc], docReal.id);

  if(!valor){
    return false;
  }

  return await rt.editarDoc(docReal, user, edicao, tipoArquivo[tipoDoc]);

}

Future<bool> deletDoc( String id, int tipoDoc) async {

  return await fs.deletDoc( tipoArquivo[tipoDoc], id);

}


Future<List<Documento>> buscarListaDeDocsAdm(int tipoDocs, String user, String edicao) async{

  //validar de o usuario é admnistrador

  List<Documento> lista = await rt.docsPortipoAdm(tipoArquivo[tipoDocs], edicao);

  return lista;

}