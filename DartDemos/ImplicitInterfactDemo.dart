class Person {
  //Inside interface, but visible only in this library.
  final _name;

  //Not inside the interface, because it is a constructor
  Person(this._name);

  //In the interface
  void greet(String who) => print('Hello, $who. I am $_name.');
}

class Imposter implements Person {
  @override
  get _name => null;

  @override
  void greet(String who) => print('Hi $who. Do you know who I am?');
}

void greetBob(Person person) => person.greet('Bob');

main() {
  greetBob(Person('Kathy'));
  greetBob(Imposter());
}
