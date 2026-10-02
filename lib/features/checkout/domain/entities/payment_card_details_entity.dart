class PaymentCardDetailsEntity {
  final String paymentMethod;
  final String nameOnCard;
  final String cvv;
  final String expiryDate;
  final String shippingAddress;
  final String cardNumber;

  PaymentCardDetailsEntity({
    required this.paymentMethod,
    required this.nameOnCard,
    required this.cvv,
    required this.expiryDate,
    required this.shippingAddress,
    required this.cardNumber,
  });
}