import 'package:shopapp/features/checkout/domain/repositories/checkout_repository.dart';

class EditShippingAddressUsecase {
  final CheckoutRepository checkoutRepository;

  EditShippingAddressUsecase({
    required this.checkoutRepository,
  });

  Future<void> call(String newShippingAddress) async{
    await checkoutRepository.editShippingAddress(newShippingAddress);
  }
}