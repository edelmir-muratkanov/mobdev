void entry() {
  var list = fillList(10);
  list = [1, 2, 3, 4, 5];
  print(list);
  print(maxValue(list));
  print(minValue(list));
}

List fillList(int n) {
  var list = [];
  for (int i = 0; i < n; i++) {
    list.add(0);
  }
  return list;
}

int maxValue(List list) {
  int max = list.first;
  for (var val in list) {
    if (val > max) max = val;
  }
  return max;
}

int minValue(List list) {
  int min = list.first;
  for (var val in list) {
    if (val < min) min = val;
  }
  return min;
}
