abstract class Publication {
  String _title;
  String _publisherName;
  int _amountOfPages;
  double _price;

  String get title => _title;
  set title(String v) => _title = v;

  String get publisherName => _publisherName;
  set publisherName(String v) => _publisherName = v;

  int get amountOfPages => _amountOfPages;
  set amountOfPages(int v) => _amountOfPages = v > 0 ? v : 0;

  double get price => _price;
  set price(double v) => _price = v > 0 ? v : 0;

  Publication(
    this._title,
    this._amountOfPages,
    this._price,
    this._publisherName,
  );
}

class Book extends Publication {
  Book(super.title, super.amountOfPages, super.price, super.publisherName);
}

class Journal extends Publication {
  Journal(super.title, super.amountOfPages, super.price, super.publisherName);
}

void main() {
  List<Publication> library = [];
  library.add(Book("Book 1", 20, 20.99, "Name 1"));
  library.add(Book("Book 2", 100, 29.99, "Name 1"));
  library.add(Book("Book 3", 39, 39.99, "Name 2"));
  library.add(Journal("Journal 1", 20, 5.99, "Name 2"));
  library.add(Journal("Journal 2", 25, 8.99, "Name 3"));

  for (var item in library) {
    String text = 'Title: ${item.title} Amount of pages: ${item.amountOfPages} ';
    text += 'Price: ${item.price} Publisher: ${item.publisherName}';
    print(text);
  }
}
