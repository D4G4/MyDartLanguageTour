main(){
  sayQuack(new EnterpriseDuck());
  sayQuack(MockDuck());
  //sayQuack(new Person());
}

sayQuack(Quackable quackable){
  quackable.quack();
}

class Quackable {
  void quack(){}
}

class MockDuck implements Quackable {
  void quack() => print("MockDuck: Quack");
  void q(){}
}

class Person {
  void quack() => print("I'm not a duck");
}

class EnterpriseDuck extends Quackable {
  void quack() {
    print("Hi, I am a Enterprise Duck");
  }
}