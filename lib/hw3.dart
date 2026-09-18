abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem(this.id, this.title, this.price);

  String getDetails();
}

mixin Downloadable {
  void download(String title) {
    print("Downloading $title");
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook(
    String id,
    String title,
    double price,
    this.durationHours,
    this.narrator,
  ) : super(id, title, price);

  String getDetails() {
    return "$title, $price KZT, $durationHours hours, $narrator";
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook(
    String id,
    String title,
    double price,
    this.fileSizeMB,
    this.author,
  ) : super(id, title, price);

  String getDetails() {
    return "$title, $price KZT, $fileSizeMB MB, $author";
  }
}

class ShoppingCart {
  List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double total =
        _items.fold(0.0, (sum, item) => sum + item.price);

    return total + total * taxRate;
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items
        .where((item) => item.price <= maxPrice)
        .toList();
  }

  void printReceipt() {
    for (MediaItem item in _items) {
      print(item.getDetails());

      if (item is Audiobook) {
        item.download(item.title);
      }

      if (item is EBook) {
        item.download(item.title);
      }
    }
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();

  Audiobook book1 =
      Audiobook("1", "Abay zholy", 5000, 8.5, "Mukhtar Auezov");

  EBook book2 =
      EBook("2", "Flowers for Eldzhernon", 3000, 5.2, "Kiz");

  EBook book3 =
      EBook("3", "1984", 2500, 3.5, "Orwell");

  cart.addItem(book1);
  cart.addItem(book2);
  cart.addItem(book3);

  cart.printReceipt();

  print("Total: ${cart.calculateTotalWithTax()}");

  print("Items under 3000:");

  List<MediaItem> cheap = cart.filterByMaxPrice(3000);

  for (MediaItem item in cheap) {
    print(item.title);
  }
}