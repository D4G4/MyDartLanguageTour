///Definition:
///           Factory constructors are used when you want to "Grab" an instance of an object in lieu of
///           returning an entirely new intance
///           For instance: Getting an instance from CacheStore or from Database, or
///                         You want to return a Subtype (of a class) rather than a class Super object

void main(List<String> args) {
  var p1 = Point.factoryConstructor("test");
  p1.x = 10;
  p1.y = 20;
  p1.saveToCache();

  var p2 = Point.factoryConstructor('test2');

  var p3 = Point.factoryConstructor("test");

  assert(p1 != p3);
  assert(p1.x == p3.x);

  ///So factory constructors are pretty useful in creating Singleton pattern as well.
}

class Point {
  //A final variable is NOT a Immutable variable, it is a var that can be assigned a single time.
  //So, [1 (44)]
  final String name;
  int x, y;

  static final Map<String, Point> _cache = <String, Point>{};

  factory Point.factoryConstructor(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final point = Point(0, 0, name: name);
      _cache[name] = point;
      return point;
    }
  }

  Point(this.x, this.y,
      {this.name}); //Dart's sugar syntax, 'name' is optional and tells that this is a "named" property

  //[1] when the Point gets instantiated, the String name needs to be assigned otherwise it cannot be mutated later.
  //So we will use something called "Inifializer List" -> "You want essentially executet this code before the body gets executed.
  Point.zero() : name = "zero" {
    x = 0;
    y = 0;
    //name = "zero";   //name cannot be assigned because it is marked as final.
  }

  void saveToCache() {
    _cache[name] = Point(x, y, name: name);
  }

  int addTogether() {
    return x + y;
  }
}
