class Student {
  String name;
  List<double> points;

  Student(this.name, this.points);

  double getAvg() {
    return points.reduce((value, total) => total + value) / points.length;
  }

  void display() {
    print('Student: $name; Avg: ${getAvg()}');
  }
}


void main() {
  var student = Student("Edelmir", [3.0, 2.4, 3.3]);
  student.display();
}