class Quackable {
  void quack(){}
}

sayQuack(Quackable quackable){
  quackable.quack();
}

class MockDuck implements Quackable {
  void quack() => print("Quack");
  void q(){}
}

class Person {
  void quack() => print("I'm not a duck");
}

class EnterpriseDuck extends Quackable {
  void quack() {
    print("Hi, I am a Enterprise Duck");
    print("Qua the fkin k");
  }
}

main(){
  sayQuack(new EnterpriseDuck());
  sayQuack(MockDuck());
  //sayQuack(new Person());
}
