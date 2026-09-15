class PaymentCardDetailsEntity {
  final String nameOnCard;
  final bool cvv;
  final String expiryDate;
  final String shippingAddress;
  final String cardNumber;

  PaymentCardDetailsEntity({
    required this.nameOnCard,
    required this.cvv,
    required this.expiryDate,
    required this.shippingAddress,
    required this.cardNumber,
  });
}