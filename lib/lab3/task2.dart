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
