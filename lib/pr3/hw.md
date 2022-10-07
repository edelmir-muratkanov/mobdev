# Практика 3.

### 1. Создайте класс Room, который будет содержать height, length и width комнаты в трех полях. Этот класс также имеет метод volume() для вычисления объема этой комнаты.

```dart
class Room {
  double height;
  double length;
  double width;

  Room(this.height, this.length, this.width);

  double volume() {
    double vol = height * length * width;
    return double.parse(vol.toStringAsFixed(2));
  }
}

void main() {
  var room = Room(2.2, 3.4, 2);
  print('Volume: ${room.volume()}');
}
```

#### Результат

```
Volume: 14.96
```

### 2. Напишите программу для реализации класса студент со следующими полями: имя студента, оценки студента полученные по трем предметам. Конструктор для присвоения начальных значений. Метод для вычисления общего среднего значения. Метод отображения имени студента и сумму баллов. Напишите соответствующую функцию main (), чтобы продемонстрировать функционирование вышеперечисленного.

```dart
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
```

#### Результат

```
Student: Edelmir; Avg: 2.9
```

### 3. Создайте абстрактный класс Animal. Ещё классы: Dog, Cat, Parrot, Fish, которые наследуются от класса Animal. Создайте интерфейсы: CanRun(), CanFly(), CunSwim(). Создайте по 3-5 объектов классов Dog, Cat, Parrot, Fish и сгруппируйте их по интерфейсам(Полиморфизм).

```dart
abstract class Animal {}

abstract class IRunnable {
  void CanRun();
}

abstract class IFlyable {
  void CanFly();
}

abstract class ISwimmable {
  void CanSwim();
}

class Dog extends Animal implements IRunnable, ISwimmable {
  @override
  void CanRun() => print('Dog can run');

  @override
  void CanSwim() => print('Dog can swim');
}

class Cat extends Animal implements IRunnable, ISwimmable{
  @override
  void CanRun() => print('Cat can run');

  @override
  void CanSwim() => print('Cat can swim');

}

class Parrot extends Animal implements IFlyable {
  @override
  void CanFly() => print('Parrot can fly');
}

class Fish extends Animal implements ISwimmable {
  @override
  void CanSwim() => print('Fish can swim');
}

void main() {
  var dogs = [Dog(), Dog(), Dog()];
  var cats = [Cat(), Cat(), Cat()];
  var parrots = [Parrot(), Parrot()];
  var fishes = [Fish(), Fish()];

  List<IRunnable> runnable = [...dogs, ...cats];
  List<ISwimmable> swimable = [...dogs, ...cats, ...fishes];
  List<IFlyable> flyable = [...parrots];

  for (var animal in runnable) {
    animal.CanRun();
  }
  for (var animal in swimable) {
    animal.CanSwim();
  }
  for (var animal in flyable) {
    animal.CanFly();
  }
}
```

#### Результат

```
Dog can run
Dog can run
Dog can run
Cat can run
Cat can run
Cat can run
Dog can swim
Dog can swim
Dog can swim
Cat can swim
Cat can swim
Cat can swim
Fish can swim
Fish can swim
Parrot can fly
Parrot can fly
```

### 4. Реализуйте класс для Человека. Человек имеет элементы данных имя, возраст, вес, рост, Дата рождения, адрес с соответствующими методами чтения/записи и т.д. Теперь создайте два подкласса Сотрудник и Студент. Сотрудник будет иметь дополнительные данные переменной зарплата, Дата соединения, опыт работы и т.д. Студент имеет данные переменной roll, listOfSubjects, их оценки и методы calculateGrade. Снова создайте два подкласса Техник и Профессор из Сотрудника. Профессор имеет данные переменной курсы, listOfAdvisee и их методы добавления/удаления. Напишите функцию main (), чтобы продемонстрировать создание объектов разных классов и вызовы их методов.

```dart
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
```

#### Результат

```
[math 1, math 2, Discrete Math]
Engineer 1
3.0
```
