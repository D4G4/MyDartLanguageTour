void main(List<String> args) {
 var p1 = Point(10, 10, name: "Daksh");
 var p2 = Point(10, 10, name: "Dakshh");

 print("The objects are equal: ${p1 == p2}");

 print(p1.hashCode);
 print(p2.hashCode);
}

class Point {
  final String name;
  int x, y;

  Point(this.x, this.y,
      {this.name});

  //Overriding an operator (we will use it to compare two objects)
  @override
  bool operator ==(otherObject) =>
      otherObject is Point &&
          otherObject.x == x &&
          otherObject.y == y;

  @override
  int get hashCode => 100;
}
