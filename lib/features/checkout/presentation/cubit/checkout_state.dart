import 'package:shopapp/features/checkout/domain/entities/payment_card_details_entity.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState{}

class CheckoutLoading extends CheckoutState{}

class CheckoutSuccess extends CheckoutState{}

class CheckoutLoaded extends CheckoutState{
  final PaymentCardDetailsEntity paymentCardDetailsEntity;

  CheckoutLoaded({
    required this.paymentCardDetailsEntity,
  });
}

class CheckoutError extends CheckoutState{
  final String error;

  CheckoutError({
    required this.error,
  });
}