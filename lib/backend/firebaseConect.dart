/*
Infomações dadas pelo firebase, como não usei todas achei melhor guarda aqui :)

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>

<!-- https://firebase.google.com/docs/web/setup#available-libraries -->

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyBIYuzeQ7-pI_yRYlYx0NWvUiXiBYUPNns",
    authDomain: "jouern-161bf.firebaseapp.com",
    databaseURL: "https://jouern-161bf.firebaseio.com",
    projectId: "jouern-161bf",
    storageBucket: "jouern-161bf.appspot.com",
    messagingSenderId: "792645314738",
    appId: "1:792645314738:web:714d8aa165f2d5d3e641ab"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
</script>
*/
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class BaseDo{

  fs.Firestore storeDocs;

  BaseDo () {
    // Responssavel pera inicialização e autenticação com o Firebase
    if(fb.apps.isEmpty){
      fb.initializeApp(
        apiKey: "AIzaSyBIYuzeQ7-pI_yRYlYx0NWvUiXiBYUPNns",
        authDomain: "jouern-161bf.firebaseapp.com",
        databaseURL: "https://jouern-161bf.firebaseio.com",
        projectId: "jouern-161bf",
        storageBucket: "jouern-161bf.appspot.com",
        messagingSenderId: "792645314738",
        appId: "1:792645314738:web:714d8aa165f2d5d3e641ab",);
    }
    storeDocs = fb.firestore();
  }
}