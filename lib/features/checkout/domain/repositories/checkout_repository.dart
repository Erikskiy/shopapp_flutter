import 'package:shopapp/features/checkout/data/models/payment_card_details_model.dart';

abstract class CheckoutRepository {
  Future<void> editShippingAddress(String newShippingAddress);

  Future<void> editPaymentCardDetails(String newPaymentMethod, String newCardNumber, String newExpiryDate, String newCVV, String newNameOnCard);

  Future<PaymentCardDetailsModel> getPaymentCardDetails();
}