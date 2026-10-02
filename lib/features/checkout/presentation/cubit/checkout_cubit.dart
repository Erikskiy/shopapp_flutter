import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/checkout/domain/usecases/edit_payment_card_details_usecase.dart';
import 'package:shopapp/features/checkout/domain/usecases/edit_shipping_address_usecase.dart';
import 'package:shopapp/features/checkout/domain/usecases/get_payment_card_details_usecase.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState>{
  final EditPaymentCardDetailsUsecase editPaymentCardDetailsUsecase;
  final EditShippingAddressUsecase editShippingAddressUsecase;
  final GetPaymentCardDetailsUsecase getPaymentCardDetailsUsecase;

  CheckoutCubit({
    required this.getPaymentCardDetailsUsecase,
    required this.editShippingAddressUsecase,
    required this.editPaymentCardDetailsUsecase,
  }):super(CheckoutInitial());


  Future<void> editPaymentCardDetails(String newPaymentMethod, String newCardNumber, String newExpiryDate, String newCVV, String newNameOnCard) async{
    try{
      emit(CheckoutLoading());

      await editPaymentCardDetailsUsecase.call(newPaymentMethod, newCardNumber, newExpiryDate, newCVV, newNameOnCard);

      final paymentCardDetailsEntity = await getPaymentCardDetailsUsecase.call();
      emit(CheckoutLoaded(paymentCardDetailsEntity: paymentCardDetailsEntity));
    } catch(e){
      emit(CheckoutError(error: e.toString()));
    }
  }

  Future<void> editShippingAddress(String newShippingAddress) async{
    try{
      emit(CheckoutLoading());

      await editShippingAddressUsecase.call(newShippingAddress);

      final paymentCardDetailsEntity = await getPaymentCardDetailsUsecase.call();
      emit(CheckoutLoaded(paymentCardDetailsEntity: paymentCardDetailsEntity));
    } catch(e){
      emit(CheckoutError(error: e.toString()));
    }
  }

  Future<void> getPaymentCardDetails() async{
    try{
      emit(CheckoutLoading());

      final paymentCardDetailsEntity = await getPaymentCardDetailsUsecase.call();
      emit(CheckoutLoaded(paymentCardDetailsEntity: paymentCardDetailsEntity));
    } catch(e){
      emit(CheckoutError(error: e.toString()));
    }
  }
}