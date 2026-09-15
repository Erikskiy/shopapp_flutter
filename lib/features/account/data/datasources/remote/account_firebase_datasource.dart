import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp/features/account/data/models/current_user_model.dart';

class AccountFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  Future<void> addProfile(String name, String email) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).set({
      "name": name,
      "email": email,
    });
  }

  Future<void> editProfile(String name, String avatarUrl) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "name": name,
      "avatarUrl": avatarUrl,
    });
  }

  Future<CurrentUserModel> getCurrentUserData() async {
    final String currentUserId = firebaseAuth.currentUser!.uid;

    final document = await firebaseFirestore.collection("users").doc(currentUserId).get();
    final data = document.data() ?? {};

    return CurrentUserModel.fromJson(data);
  }
}