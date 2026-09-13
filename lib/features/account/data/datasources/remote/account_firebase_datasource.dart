import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  Future<void> addProfile(String name) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).set({
      "name": name,
    });
  }

  Future<void> editProfile(String name, String avatarUrl) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "name": name,
      "avatarUrl": avatarUrl,
    });
  }

  // Future<String> getCurrentUserName() async{f
  // inal String currentUserId = firebaseAuth.currentUser!.uid;
  //   return await firebaseFirestore.collection("users").doc(currentUserId).
  // }
}