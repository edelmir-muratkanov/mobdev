class Human {
  String name;
  int age;
  double weight;
  double height;
  String birthDate;
  String address;

  Human(this.name, this.height, this.weight, this.age, this.birthDate, this.address);
}

class Employee extends Human {
  int salary;
  String joinDate;
  double exp;

  Employee(super.name, super.height, super.weight,
      super.age, super.birthDate, super.address,
      this.salary, this.joinDate, this.exp);

}

class Student extends Human {
  String role;
  Map<String, double> subjects;

  Student(super.name, super.height, super.weight,
      super.age, super.birthDate, super.address,
      this.role, this.subjects);

  double calculateGpa() {
    var items = subjects.entries;
    var total = items
        .map((e) => e.value)
        .reduce((value, element) => element + value);
    return double.parse((total / items.length).toStringAsFixed(2));
  }
}

class Engineer extends Employee {
  Engineer(super.name, super.height, super.weight, super.age, super.birthDate, super.address, super.salary, super.joinDate, super.exp);
}

class Professor extends Employee {
  List<String> courses;
  List<String> advising;

  Professor(super.name, super.height, super.weight,
      super.age, super.birthDate, super.address,
      super.salary, super.joinDate, super.exp,
      this.advising, this.courses);

  void addCourse(String val) {
    courses = [...courses, val];
  }

  void removeCourse(String val){
    courses.remove(val);
  }

  void addAdvice(String val) {
    advising = [...advising, val];
  }

  void removeAdvice(String val) {
    advising.remove(val);
  }
}

void main() {
  var p = Professor("Proffesor 1", 1.7, 60, 60, "01.01.1960", "Almaty",
      100000, "01.01.2019", 3, ["group 1", "group 2"], ["math 1", "math 2"]);
  var e = Engineer("Engineer 1", 1.8, 65, 30, "01.01.1992", "Almaty",
      150000, "01.01.2019", 3);
  var s = Student("Student 1", 1.77, 54, 20, "01.01.2002", "Almaty", "Computer Science",
      {"Design patterns": 3.0, "Web": 4.0, "Java": 2.0});

  p.addCourse('Discrete Math');
  print(p.courses);

  print(e.name);

  print(s.calculateGpa());
}