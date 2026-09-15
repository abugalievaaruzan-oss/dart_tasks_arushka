void main() {
  processOrder(
    orderId: 101,
    itemPrice: 10000,
    promoCode: "SAVE10",
    );
}

double processOrder({
  required int orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  deliveryFee = deliveryFee ?? 500.0;

  if (promoCode == "SAVE10") {
    itemPrice = itemPrice * 0.9;
  }

  double total = itemPrice + deliveryFee;
  print("Order ID: $orderId");
  print("Item price: $itemPrice KZT");
  print("Delivery: $deliveryFee KZT");
  print("Total: $total KZT");

  return total;
}
