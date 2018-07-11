class Point {
  var x;
  var y;

  int distanceTo(var x, var y) {
    return x - y;
  }

  Point(this.x, this.y);

  //Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }

  static Point fromJson(Map<String, dynamic> json) {
    return new Point(json['x'], json['y']);
  }
  //or
  //  Point.fromJson(Map<String, dynamic> json) {}

  @override
  String toString() {
    return 'x = $x '
        'y = $y';
  }
}

void main() {
  var p = Point(2, 2);
  var p1 = Point.fromJson({'x': 1, 'y': 2});
  var pNamedConstructor = Point.origin();


  print(p.toString());
  print(p1.toString());
  print(pNamedConstructor.toString());

}
