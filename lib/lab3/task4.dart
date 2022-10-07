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

void main() {
  var acs = [
    CurrentAccount(1, 'Edelmir', 0, 0.5),
    CurrentAccount(2, 'Alex', 120, 0.33),
    CurrentAccount(3, 'Edelmir', 100, 0.65)
  ];

  int year = 5;

  for (var acc in acs) {
    String text = 'Acc: ${acc._id} | ${acc._ownerName}';
    text +=
        ' rates ${acc.calculateYearRate(year).toStringAsFixed(2)} for $year years';
    print(text);
  }
}
