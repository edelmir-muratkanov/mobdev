void entry() {
  print('...Task 1...');
  task1(2, 10);
  print('...Task 2...');
  print(task2(15));
  print('...Task 3...');
  print(task3(105));
  print('...Task 4...');
  print(task4(15));
  print('...Task 5...');
  print(task5(11));
  print('...Task 6...');
  print(task6(2, 4));
  print('...Task 7...');
  print(task7(3, 5));
}

void task1(int a, int b) {
  for (int i = a; i <= b; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

int task2(int num) {
  String snum = num.toString();
  int sum = 0;
  for (int i = 0; i < snum.length; i++) {
    sum += int.parse(snum[i]);
  }

  return sum;
}

int task3(int num) {
  return num.toString().length;
}

int task4(int num) {
  String snum = num.toString();
  int biggest = int.parse(snum[0]);

  for (int i = 1; i < snum.length; i++) {
    var j = int.parse(snum[i]);
    if (j > biggest) {
      biggest = j;
    }
  }

  return biggest;
}

int task5(int pos) {
  if (pos == 1 || pos == 2) return 1;
  return task5(pos - 1) + task5(pos - 2);
}

int task6(int a, int b) {
  int multiply(x, y) {
    return x * y;
  }

  return multiply(a, b);
}

int task7(int a, int b) {
  compare(x, y) => x > y ? x : y;
  return compare(a, b);
}
