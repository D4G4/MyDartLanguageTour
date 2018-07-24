void main(List<String> args) {
  var p1 = Point();
  //p1.x(10); //Error The method 'call' was called on null.
  p1.x = 10;
  p1.yKaSetter = 20;

  print(p1.addTogether());
  print(p1.add);
}

class Point {

  String name;
  int _x, _y;    //These are accessible in same File

  //But this is accessible only inside this class
  static final Map<String, Point> _cache = <String, Point>{};

  int addTogether() {
    return _x + _y;
  }

  int get add => _x + yKaGetter;

  get x => _x;
  get yKaGetter => _y;

  void set x(val) {
    _x = val;
  }

  void set yKaSetter (val) {
    _y = val;
  }
}
