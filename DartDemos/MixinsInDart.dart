class A {
  void classAsMethod() => print("A's method");
}

class B implements A {
  @override
  void classAsMethod() => print("A's method inside B");

  void classBsMethod() => print("B's method");
}

class C {
  void classCsMethod() => print("C's method");
}

class D extends A with C {}

class E extends A with C, B {
  //now you won't be able to override class A's method
  //But what is the purpose?
}

void main() {
  D d = new D();
  d.classAsMethod();

  E e = new E();
  e.classAsMethod();
}
