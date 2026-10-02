import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/features/checkout/data/models/payment_card_details_model.dart';

class CheckoutFirebaseDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> editShippingAddress(String newShippingAddress) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "shippingAddress": newShippingAddress,
    });
  }

  Future<void> editPaymentCardDetails(String newPaymentMethod, String newCardNumber, String newExpiryDate, String newCVV, String newNameOnCard) async{
    final String currentUserId = firebaseAuth.currentUser!.uid;
    await firebaseFirestore.collection("users").doc(currentUserId).update({
      "paymentMethod": newPaymentMethod,
      "cardNumber": newCardNumber,
      "expiryDate": newExpiryDate,
      "cvv": newCVV,
      "nameOnCard": newNameOnCard,
    });
  }

  Future<PaymentCardDetailsModel> getPaymentCardDetails() async{
    final String userId = firebaseAuth.currentUser!.uid;
    final currentPaymentCardDetails = await firebaseFirestore.collection("users").doc(userId).get();
    final Map<String, dynamic> data = await currentPaymentCardDetails.data() ?? {};
    return PaymentCardDetailsModel.fromJson(data);
  }
}