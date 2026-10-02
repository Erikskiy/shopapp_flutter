import 'package:shopapp/features/checkout/data/models/payment_card_details_model.dart';
import 'package:shopapp/features/checkout/domain/repositories/checkout_repository.dart';

class GetPaymentCardDetailsUsecase {
  final CheckoutRepository checkoutRepository;

  GetPaymentCardDetailsUsecase({
    required this.checkoutRepository,
  });

  Future<PaymentCardDetailsModel> call() async{
   return await checkoutRepository.getPaymentCardDetails();
  }
}