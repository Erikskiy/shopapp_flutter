import 'package:shopapp/features/checkout/domain/repositories/checkout_repository.dart';

class EditPaymentCardDetailsUsecase {
  final CheckoutRepository checkoutRepository;

  EditPaymentCardDetailsUsecase({
    required this.checkoutRepository,
  });

  Future<void> call(String newPaymentMethod, String newCardNumber, String newExpiryDate, String newCVV, String newNameOnCard) async{
    return await checkoutRepository.editPaymentCardDetails(newPaymentMethod, newCardNumber, newExpiryDate, newCVV, newNameOnCard);
  }
}