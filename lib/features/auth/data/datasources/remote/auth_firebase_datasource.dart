import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signup(String email, String password) async{
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> login(String email, String password) async{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async{
    await firebaseAuth.signOut();
  }

  String getCurrentUser(){
    try{
      return firebaseAuth.currentUser!.uid;
    }catch(e){
      return "";
    }
  }
}