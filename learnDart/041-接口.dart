/*
* dart没有interface关键字，所有的类都是既可以extends又可以implements
* 如果extends则扩展，
* 如果implements则实现
* */

abstract class Animal {
  void run();

  void eat();
}

class Dog implements Animal {
  @override
  void eat() {
    print("dog is eating");
  }

  @override
  void run() {
    print("dog is running");
  }
}

class Cat extends Dog {}

void main() {
  var c = Cat();
  c.run();
  c.eat();
}
