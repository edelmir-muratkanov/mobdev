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

void main() {
  var list = Stack();
  list.push(1);
  list.push(2);
  list.push(3);
  list.pop();
  list.display();
}
