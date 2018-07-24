class Cookie {
  var numberOfChips;

  Cookie({this.numberOfChips});
}

//constant constructors seem a cheap way of creating objects with
//getters and no corresponding setter
class PerfectCookie {
  final numberOfChips;

  const PerfectCookie(
      {this.numberOfChips}); //the final variable must be intialized.
}

/**But...
 * The point of constant constructor is not to initialize the final fields.
 * Any generative constructor can do that.
 * The point is to create Compile-Time constants:
 * Objects where all the field values are known already at compile time, without executing any statements.
 *
 * But that puts some restrictions on the class and the constructor.
 * A constructor can not have a body (no statements executed!);
 * It's class must not have any non-final fields. (the value we know must not change at the compile time)
 *
 * The initializer list must also only initialize fields to other compile time constants,
 * so "Right Hand Sides" are only limited to "Compile time constant expressions"
 *
 * And it must be prefixed with "const" -
 * otherwise you just get a normal constructor that happens to satisfy those requirements.
 *
 * So basically, in order to create a compile-time constant object,
 * you then replace "new" keywoard with "const"  in a "new"-expression
 * You can still use "new" with a const-constructor, and it will create an object,
 * but it will just be a normal object, not compile time constant.
 *
 * That's it,
 * A constant constructor can also be used as a normal constructor to create objects at runtime,
 * as well as creating compile time constant objects at compilation time.
 */
class Point {
  static final Point ORIGIN = const Point(0, 0);
  final int x;
  final int y;

  const Point(this.x, this.y);

  //Initializing instance variales before constructor body runs.
  Point.clone(Point other)
      : x = other.x,
        y = other.y{
    print('Clone: Variables have already been initialized');
  }
  //Yes, a class can have both constant and non constant constructors;
}

main() {
  var cookie = Cookie(numberOfChips: 5);
  var perfectCookie = PerfectCookie(numberOfChips: 42);     //even though this constructor has a const keywoard present

  print("An ordinary cookie has ${cookie.numberOfChips} number of chips");
  print(
      "An perfect  cookie has ${perfectCookie.numberOfChips} number of chips");

  cookie.numberOfChips = 42;
  //perfectCookie.numberOfChips = 42;       //Error

  Point p0 = Point.ORIGIN;

  Point p1 = new Point(0, 0);     //Using constant constructor as normal constructor

  Point p2 = new Point.clone(p0);

  Point p3 = const Point(0, 0);


  print(identical(p0, p1)); //false
  print(identical(p0, p2)); //false
  print(identical(p0, p3)); //true!

  /**
   * Compile-time constants are canonicalized,
   * i.e. no matter how many times you write "const Point(0, 0)",
   * you only create one object.
   *
   * This may sound useful, but you can simply create const variable to hold the value and use that variable instead.
   *
   * So, what are compile-time constants good for anyway?
      They are useful for enums.
      You can use compile-time constant values in switch cases.
      They are used as annotations.
   */
}
