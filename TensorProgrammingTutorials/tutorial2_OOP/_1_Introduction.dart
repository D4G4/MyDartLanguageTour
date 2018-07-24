void main(List<String> args) {
  var p = Point.zero();
  p.x = 20;
  p.y = 30;

  //Cascade operator
  var p1 = Point.zero()
    ..x = 10
    ..y = 20;

  print(p.addTogether());
  print(p1.addTogether());
}

class Point {
  int x, y;

  //Normal JAVA code
  /*Point(int x, int y) {
    this.x = x;
    this.y = y;
  }*/

  Point(this.x, this.y);    //Dart's sugar syntax

  /*Point(); */ //Error: Default constructor already defined
  //So create a named constructor
  Point.zero() {
    x = 0;
    y = 0;
  }

  int addTogether() {
    return x + y;
  }
}
