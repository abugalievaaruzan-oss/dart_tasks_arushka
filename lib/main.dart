void main() {
  double result = processOrder(
    orderId: "001",
    itemPrice: 10000,
    promoCode: "SAVE10",
  );

  print("Final total: $result KZT");
}

double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double discount = 0;

  if (promoCode == "SAVE10") {
    discount = itemPrice * 0.10;
  }

  double priceAfterDiscount = itemPrice - discount;

  double delivery = deliveryFee ?? 500.0;

  double total = priceAfterDiscount + delivery;

  print("=== ORDER SUMMARY ===");
  print("Order ID: $orderId");
  print("Original price: $itemPrice KZT");
  print("Discount: $discount KZT");
  print("Price after discount: $priceAfterDiscount KZT");
  print("Delivery: $delivery KZT");
  print("Total: $total KZT");

  return total;
}