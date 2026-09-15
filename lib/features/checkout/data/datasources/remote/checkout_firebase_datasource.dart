import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckoutFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> editShippingAddress(String newShippingAddress) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "shippingAddress": newShippingAddress,
    });
  }

  Future<void> editPaymentCardDetails(String newCardNumber, String newExpiryDate, int newCVV, String newNameOnCard) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "cardNumber": newCardNumber,
      "expiryDate": newExpiryDate,
      "cvv": newCVV,
      "nameOnCard": newNameOnCard,
    });
  }
}