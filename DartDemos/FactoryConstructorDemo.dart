//Use the factory keywoard when implementing a constructor that doesn't always
//create a new instance of it's class;

//Simple example (JavaLike singleton)
class FactConst {
  static FactConst factConst;
  var val;

  factory FactConst(String variableValue) {
    if (factConst == null) {
      factConst = new FactConst._internal(variableValue);
    }
    return factConst;
  }

  FactConst._internal(this.val) {}
}

/**
 * A factory constructor can check if it has a prepared reusable instance in an internal cache
 * and return this instance or otherwise create a new one.
 */
class Logger {
  final String name;
  bool mute = false;

  static final _internalCache = <String, Logger>{};

  //Usually constructors does not have a return type.
  factory Logger(String name) {
    if (_internalCache.containsKey(name)) {
      return _internalCache[name];
    } else {
      final logger = Logger._internal(name);
      _internalCache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }

//NOTE Factory constructors have no access to `this`
}

/*
A Factory constructor affords an abstract class to be
instantiated by another class, despite being abstract.
 */
abstract class Animal {
  var name;

  String makeNoise(String sound);

  String chooseColor(String color);

  //factory Animal() => new Cat();    [1]
  factory Animal(String type) {
    switch (type.toLowerCase()) {
      case 'cat':
        return new Cat();
      case 'dog':
        return new Dog();
      default:
        throw "The '$type' is not an animal";
    }
  }
}

class Cat implements Animal {
  var name;

  Cat() : this.name = "Cat" {}

  @override
  String chooseColor(String color) {
    return 'I am a $name and my color is $color';
  }

  @override
  String makeNoise(String sound) {
    return '$sound!!!!!!';
  }
}

//The factory constructor also prevents you from doing this
class Dog implements Animal {
  var name;

  Dog() : this.name = "Dog" {}

  @override
  String chooseColor(String color) {
    return 'I am a $name and my color is $color';
  }

  @override
  String makeNoise(String sound) {
    return '$sound!!';
  }
}

main() {
  var logger = Logger('UI');
  logger.log('Button clicked');

  /*
  [1]
  Cat cat = new Animal();
  Dog dog = new Animal();   //Error 'Cat' is not a 'Subtype' of Dog
  */

  //[2]
  Cat cat = new Animal("cat");
  Dog dog = new Animal("dog");

  print(cat.chooseColor("Pink"));
  print(dog.chooseColor("Red"));
}

/**
 * TODO: Differene between Factory constructor and Constant constructor
 *
 * A constant constructor allows you to have instance of another class in compile-time constant expression.
 * see [UnderstandingConceptOfConstantConstructor.dart]
 *
 * A Factort constructor and a Constant constructor that returns new instance of a class are more similar.
 * The difference is, that a factory constructor is called with 'new' like a normal constructor
 * and some limitations that a constant method doesn't have.
 *
 * The main difference:
 * You can influence if actually a new instance is created and of what concrete type it is.
 *
 * You can for example
 * Have an abstract class A (which can't be instantiated) with a factory constructor
 * that returns an instance of a concrete subclass of A
 * depending for example on the arguments passed to the factory constructor.
 *
 * Key point:
 * When extending an abstract class, the subclass must implemnt all of the absctract methods
 * in order to be classified as "concrete class".
 *
 * Therefore:
 * The bottom-level classes must be concrete,
 * otherwise no instance will every be created that exhibit(manifest clearly) the defined behaviour.
 *
 */
