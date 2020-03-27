// classes destidadas a manipulação de objetos json

class Documento {
  String idRealtime;
  String apelido;
  String data;
  String id;

  Documento(this.idRealtime, this.apelido, this.data, this.id);

}

class DocInfo {
  String nome;
  String titulo;
  String considerando;
  String resolve;

  DocInfo(this.nome, this.titulo, this.considerando, this.resolve);
}