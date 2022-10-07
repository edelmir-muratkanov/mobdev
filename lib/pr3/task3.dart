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