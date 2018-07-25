class A {
  int x = 10;

  void m() {
    print("method m");
  }
}

class MyMixin {
  void f() {
    print("method f");
  }
}

class B extends A with MyMixin {}

void main() {
  var b = B();
  print(b.x);
}

class Counter {
  int _counter = 0;

  int next() => ++_counter;
}

class Operation {
  void operate(int step) {
    print("Operating");
  }
}

class $OperationWithCounter = Operation with Counter;

class AutoStepOperation extends $OperationWithCounter {
  void operate([int step]) {
    super.operate(step ?? super.next());
  }
}
