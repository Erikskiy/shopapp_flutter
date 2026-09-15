import 'package:shopapp/features/checkout/domain/entities/payment_card_details_entity.dart';

class PaymentCardDetailsModel extends PaymentCardDetailsEntity{
  PaymentCardDetailsModel({
    required super.nameOnCard,
    required super.cardNumber,
    required super.cvv,
    required super.expiryDate,
    required super.shippingAddress,
  });

  factory PaymentCardDetailsModel.fromJson(Map<String, dynamic> json){
    return PaymentCardDetailsModel(
        nameOnCard: json["nameOnCard"] ?? "",
        cardNumber: json["cardNumber"] ?? "",
        cvv: json["cvv"] ?? "",
        expiryDate: json["expiryDate"]?? "",
        shippingAddress: json["shippingAddress"] ?? "",
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "nameOnCard": nameOnCard,
      "cardNumber": cardNumber,
      "cvv": cvv,
      "expiryDate": expiryDate,
      "shippingAddress": shippingAddress,
    };
  }
}