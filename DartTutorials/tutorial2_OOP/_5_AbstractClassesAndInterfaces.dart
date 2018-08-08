//TODO: Mixins...
void main() {
  //var t = Thing();  //Error: Can not instantiate Abstract class
}

abstract class Thing {
  String name;
  int age;

  Thing(this.name, this.age);

  String get color;
}

class Chair extends Thing {
  Chair(String name, int age) : super(name, age); //Using initalizer list
  //But the name and the age variable will be associated with the Chair object.

  @override
  String get color => "Blue";
}

class A {
  int a;
  int b;
}

class B {
  int c;
}

//Error
/*class C extends A, B {
  
}*/

class C implements A, B {
  @override
  int a;

  @override
  int b;

  @override
  int c;
}
