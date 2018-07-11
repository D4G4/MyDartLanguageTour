void foo() {} // A top-level function

class A {
  var pedu;
  static void bar() {}    //A static method
  void baz() {
    print("Hello");
  }           //An instance method
}

void main() {
  var x;

  //Comparing top-level functions
  x = foo;
  assert(foo == x);
  print('foo == x ${foo == x}');

  //Comparing static methods
  x = A.bar;
  assert(A.bar == x);
  print('A.bar == x ${A.bar == x}');

  //Comparing instance methods
  var v = A();
  var w = A();
  var y = w;
  x = w.baz;

  var p = A();
  if(p is A){
    p.pedu = 20;
  }
  (p as A).pedu = 21; // ignore: unnecessary_cast
  print(p.pedu);

  //These closures refer to the same instace (w)
  //so they're equal
  assert(y.baz == x);

  //These closures refer to different instances,
  //so they're unequal
  assert(v.baz != w.baz);


}