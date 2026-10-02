import 'package:shopapp/features/checkout/data/datasources/remote/checkout_firebase_datasource.dart';
import 'package:shopapp/features/checkout/data/models/payment_card_details_model.dart';
import 'package:shopapp/features/checkout/domain/repositories/checkout_repository.dart';

class CheckoutRepositoryImpl extends CheckoutRepository{
  final CheckoutFirebaseDatasource checkoutFirebaseDatasource;

  CheckoutRepositoryImpl({
    required this.checkoutFirebaseDatasource,
  });

  @override
  Future<PaymentCardDetailsModel> getPaymentCardDetails() async{
    return await checkoutFirebaseDatasource.getPaymentCardDetails();
  }

  @override
  Future<void> editPaymentCardDetails(String newPaymentMethod, String newCardNumber, String newExpiryDate, String newCVV, String newNameOnCard) async{
    return await checkoutFirebaseDatasource.editPaymentCardDetails(newPaymentMethod, newCardNumber, newExpiryDate, newCVV, newNameOnCard,);
  }

  @override
  Future<void> editShippingAddress(String newShippingAddress) async{
    await checkoutFirebaseDatasource.editShippingAddress(newShippingAddress);
  }
}