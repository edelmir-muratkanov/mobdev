# Лабораторная работа 3. ООП

## 1. Реализуйте класс для стека целых чисел с использованием массива. Обратите внимание, что операции, определенные для структуры данных стека, следующие: “push – добавляет один элемент с конца”, “pop – удаляет один элемент с конца”, “print – печатает все элементы массива”.

```dart
class Stack {
  final _list = [];

  void push(int el) {
    _list.add(el);
  }

  int pop() {
    if (_list.isEmpty) {
      return -1;
    }
    var _ = _list.last | 0;
    _list.removeLast();
    return _;
  }

  void display() {
    print(_list);
  }
}
```

### Использование

```dart
void main() {
  var list = Stack();
  list.push(1);
  list.push(2);
  list.push(3);
  list.pop();
  list.display();
}
```

### Результат

```
[1, 2]
```

## 2. Напишите класс “BankAccount” со следующими переменными экземпляра: AccountID (целое число), balance (число с плавающей запятой) и “OwnerName” (строка). Напишите правильный конструктор для этого класса. Также напишите методы showBalance(для вывода суммы), add (для внесения суммы) и subtract (для вычета) и реализуйте их. Теперь создайте еще один класс “AccountManager”, содержащий массив BankAccount. Напишите методы create (создать учетную запись), delete(удалить учетную запись), deposit (внести сумму на счет) и withdraw (снять сумму со счета). Добавьте 5 учетных записей. Теперь распечатайте реквизиты всех счетов в этом банке.

```dart
class BankAccount {
  int id;
  double balance;
  String ownerName;

  BankAccount(this.id, this.balance, this.ownerName);

  void showBalance() {
    print('Balance: $balance');
  }

  void add(double value) {
    balance += value;
  }

  void subtract(double value) {
    balance -= value;
    if (balance < 0) {
      balance = 0;
    }
  }
}

class AccountManager {
  List<BankAccount> bankAccounts = [];

  void create(String name) {
    int id;
    if (bankAccounts.isNotEmpty) {
      id = bankAccounts.last.id + 1;
    } else {
      id = 0;
    }
    var ac = BankAccount(id, 0, name);
    bankAccounts.add(ac);
  }

  void delete(int id) {
    for (var acc in bankAccounts) {
      if (acc.id == id) {
        bankAccounts.remove(acc);
      }
    }
  }

  void deposit(int id, double value) {
    for (var acc in bankAccounts) {
      if (acc.id == id) {
        acc.add(value);
      }
    }
  }

  void withdraw(int id, double value) {
    for (var acc in bankAccounts) {
      if (acc.id == id) {
        acc.subtract(value);
      }
    }
  }

  void status() {
    for (var acc in bankAccounts) {
      String text = 'ID: ${acc.id}\t Owner: ${acc.ownerName}\t';
      text += 'Balance: ${acc.balance.toStringAsFixed(2)}';
      print(text);
    }
  }
}

```

### Использование

```dart
void main() {
  var manager = AccountManager();
  manager.create('Edelmir');
  manager.create('Edelmir');
  manager.create('Edelmir');
  manager.create('Edelmir');
  manager.create('Edelmir');
  manager.deposit(0, 50);
  manager.deposit(2, 1000);
  manager.withdraw(2, 30);
  manager.withdraw(0, 60);
  manager.status();
}
```

### Результат

```
ID: 0	 Owner: Edelmir	Balance: 0.00
ID: 1	 Owner: Edelmir	Balance: 0.00
ID: 2	 Owner: Edelmir	Balance: 970.00
ID: 3	 Owner: Edelmir	Balance: 0.00
ID: 4	 Owner: Edelmir	Balance: 0.00
```

# 3. Создайте абстрактный класс Publication с переменными

-   title
-   amountOfPages
-   price
-   publisherName
-   и т.д

# с их функциями доступа/модификатора. Теперь создайте два подкласса Book и Journal. Напишите функцию main() и создайте три книги и два журнала, добавьте их в библиотеку и распечатайте детали всех публикаций.

```dart
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
```

### Использование

```dart
List<Publication> library = [];
  library.add(Book("Book 1", 20, 20.99, "Name 1"));
  library.add(Book("Book 2", 100, 29.99, "Name 1"));
  library.add(Book("Book 3", 39, 39.99, "Name 2"));
  library.add(Journal("Journal 1", 20, 5.99, "Name 2"));
  library.add(Journal("Journal 2", 25, 8.99, "Name 3"));

  for (var item in library) {
    String text = 'Title: ${item.title}\t Amount of pages: ${item.amountOfPages}\t';
    text += 'Price: ${item.price}\t Publisher: ${item.publisherName}';
    print(text);
  }
```

### Результат

```
Title: Book 1 Amount of pages: 20 Price: 20.99 Publisher: Name 1
Title: Book 2 Amount of pages: 100 Price: 29.99 Publisher: Name 1
Title: Book 3 Amount of pages: 39 Price: 39.99 Publisher: Name 2
Title: Journal 1 Amount of pages: 20 Price: 5.99 Publisher: Name 2
Title: Journal 2 Amount of pages: 25 Price: 8.99 Publisher: Name 3
```

# 4. Напишите класс для Account, содержащий элементы данных

-   accountNumber,
-   holderName
-   balance

# и добавьте конструкторы и необходимые функции доступа/модификатора для этих элементов данных. Теперь создайте класс CurrentAccount, наследующих от класса Account. CurrentAccount будет иметь переменную InterestRate и функцию calculateYearlyInterest. Создайте несколько аккаунтов и для InterestRate укажите процент, в CalculateYearlyInterest передайте количество лет, чтобы вывести полученные проценты от вложения.

```dart
class Account {
  int _id;
  String _ownerName;
  double _balance;

  int get id => _id;
  set id(int val) => _id = val > 0 ? val : 1;

  String get ownerName => _ownerName;
  set ownerName(String val) => _ownerName = val;

  double get balance => _balance;
  set balance(double val) => _balance = val < 0 ? 0 : val;

  Account(this._id, this._ownerName, this._balance);
}

class CurrentAccount extends Account {
  double _rate;

  double get rate => _rate;
  set rate(double val) => _rate = val >= 0 ? val : 1;

  CurrentAccount(super.id, super.ownerName, super.balance, this._rate);

  double calculateYearRate(int year) {
    return _rate * year;
  }
}
```

## Использование

```dart
var acs = [
    CurrentAccount(1, 'Edelmir', 0, 0.5),
    CurrentAccount(2, 'Alex', 120, 0.33),
    CurrentAccount(3, 'Edelmir', 100, 0.65)
  ];

  int year = 5;

  for (var acc in acs) {
    String text = 'Acc: ${acc._id} | ${acc._ownerName} rates ';
    text += '${acc.calculateYearRate(year).toStringAsFixed(2)} for $year years';
    print(text);
  }
```

## Результат

```
Acc: 1 | Edelmir rates 2.50 for 5 years
Acc: 2 | Alex rates 1.65 for 5 years
Acc: 3 | Edelmir rates 3.25 for 5 years
```
