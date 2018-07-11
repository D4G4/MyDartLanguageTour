main() {
  //TODO:  Num
  int x = 1;
  int hex = 0xDEADBEEF;
  double y = 1.1;
  double exponents = 1.42e5;

  print(double.parse("7.78313e+2")); //778.313
  print(exponents); //142000.0
  print(hex); //3735928559

  print('${x.toString()}');
  String str = x.toString();
  //assert (str != '1');

  print('${3.14159.toStringAsFixed(2)}'); //3.14

  //Traditional bitwise shift
  assert((3 << 1) == 6); // 0011 << 1 == 1100
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 = 0111;
  assert((3 & 4) == 0); // 0011 & 0100 = 0000;

  /**
   * What is compile time constants?
   * If a primitive type or a string is defined as a constant and the value knows at the compile time,
   * the compiler replaces the constant name everywhere in the code with it's value.
   *
   * Compile time consant must be:
      -> Declared final
      -> Primitive or String
      -> Initialized with declaration
      -> Initialized with constant expression
      So, `private final int x = getX();` is not constant.
   */
  // -----------------------------------------------------------------

  //TODO: Strings -> UTF-16 code units.
  /// Note: The == operator tests whether two objects are equivalent.
  /// Two strings are equivalent if they contain the same sequence of code units.

  var multiLineString = '''
  You can create multi line string 
  like this one.
  ''';

  var multiLineStringVersion2 = """
  You can also create multi line string
  like this as well.
  """;

  print(multiLineString);
  print(multiLineStringVersion2);

  String rawString = r"In a raw string, even \n isn't special";
  print(rawString + '\n');
  // -----------------------------------------------------------------

  // Arrays A.K.A Lists

  var list = [1, 2, 3];

  ///Note: The analyzer infers that list has type List<int>.
  ///If you try to add non-integer objects to this list,
  ///the analyzer or runtime raises an error.
  // -----------------------------------------------------------------

  //TODO:  Maps
  var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};
  print(nobleGases[2]);

  //You can create the same objects using map constructor
  var gifts = Map();
  gifts['first'] = 'dildo';
  gifts['second'] = 'viberator';

  //reinstantiate gifts
  //gifts = {'three': 'cake'};
  //add a new value
  gifts['fourth'] = 'calling birds';

  print("Printing gifts map status");
  print(gifts.length);
  print(gifts['first']);

  //Creating a compile time constant map
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  // -----------------------------------------------------------------

  //TODO:  Runes : UTF-32 code points of a string.
  // To specify more or less than 4 hex digits, place the value in curly brackets

  var cool = ' \u{1f60e}';
  print(cool);
  print(cool.codeUnits); //returns 16-bit coded units
  print(cool.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
  // -----------------------------------------------------------------

  //TODO:Functions
  var familyMembers = new List();
  familyMembers.add("daksh");
  familyMembers.add("suresh");
  familyMembers.add("ramesh");

  bool isAFamilyMember(String memberName) {
    return familyMembers.contains(memberName);
  }

  isAMemberOfFamily(String memberName) {
    return familyMembers.contains(memberName);
  }

  bool isMember(String memberName) => familyMembers.contains(memberName);
// -----------------------------------------------------------------

//Optional parameters
// Can be either positional or named, but NOT both.

  bool _bold;
  bool _hidden;

  //normal scenario
  void enableFlags(bool bold, bool hidden) {
    _bold = bold;
    _hidden = hidden;
    print('Inside normal function');
  }

  enableFlags(true, false);

  //Optional named parameters
  void enableFlagsWithOptonalNamedParameters({bool bold, bool hidden}) {
    _bold = bold;
    _hidden = hidden;
    print('Inside Optional Named Parameters');
  }

  enableFlagsWithOptonalNamedParameters(hidden: true, bold: false);

  //Optional positional parameters
  void enableFlagsWithOptionalPositionalParameters(String from, String message,
      [String device]) {
    var result = '$from says $message';
    if (device != null) {
      result = '$result with a $device';
    }
    print(result);
  }

  enableFlagsWithOptionalPositionalParameters('Daksh', 'Hello world');
  enableFlagsWithOptionalPositionalParameters(
      'Daksh', 'Hello world', 'Smoke signal');

  //Default parameter values
  enableFlagsWithDefaultPositionalwParameterValues(
      [bool bold = true, bool hidden = true]) {
    print('$bold  $hidden');
  }

  enableFlagsWithDefaultPositionalwParameterValues(false);

  enableFlagsWithDefaultNamedParameterValues(
      {bool bold = true, bool hidden = true}) {
    print('$bold  $hidden');
  }

  enableFlagsWithDefaultNamedParameterValues(bold: true);

  //------------------------------------------------------------------

  //TODO: Function as first-class objects
  void printElement(dynamic element) {
    print('$element  ${element.runtimeType}');
  }

  var listToBePrinted = [1, 2, 3, "dennis"];
  listToBePrinted.forEach(printElement);
  listToBePrinted.forEach((value) => printElement(value));
  //------------------------------------------------------------------

  //TODO: Anonymous functions
  var listToIterate = ['apples', 'bananas', 'oranges'];
  listToIterate
      .forEach((item) => print('${listToIterate.indexOf(item)}: $item'));
  //------------------------------------------------------------------

  //TODO: Lexical scope
  //Scope of variables is determined statically, simply by the layout of the code.
  //------------------------------------------------------------------

  /**
   * TODO: Lexical closur
   * [makeAdder]
   */
  var add2 = makeAdder(2); //add2(int value) { return 2 + value };
  var add4 = makeAdder(4);
  var test = (int value) => 3 + value;

  print(add2(3));
  print(add4(3));
  print(test(2));
  //------------------------------------------------------------------

  /**
   * TODO: Test functions for equality
   * Here’s an example of testing top-level functions, static methods, and instance methods for equality
   * [TestingFunctionsForEquality]
   */
  //------------------------------------------------------------------

  //TODO: Return values
  //All functions return a value.
  // If no return value is specified, the statement return null;
  // is implicitly appended to the function body.
  foo() {}
  assert(foo() == null);

  String fooStr() {
    return '';
  }

  assert(fooStr() != String);
  assert(fooStr() == '');
  //------------------------------------------------------------------

  //TODO: Assignment operation  ??=
  var value = 20;
  var b;
  //Assign value to B if B is null, else B remains the same
  b ??= value;
  print(b);
  value = 22;
  b ?? value;
  print(b);
  //------------------------------------------------------------------

  //TODO: Cascade notation
  /**
   * Cascades (..) allow you to make a sequence of operations on the same object.
   * In addition to function calls, you can also access fields on that same object.
   * This often saves you the step of creating a temporary variable and allows you to write more fluid code.
      Consider the following code:
      __________________________________________________________
      |                                                         |
      | querySelector('#confirm') // Get an object.             |
      |   ..text = 'Confirm' // Use its members.                |
      |   ..classes.add('important')                            |
      |   ..onClick.listen((e) => window.alert('Confirmed!'));  |
      |_________________________________________________________|

   * The first method call, querySelector(), returns a selector object.
   * The code that follows the cascade notation operates on this selector object,
   * ignoring any subsequent values that might be returned.

   * The previous example is equivalent to:
      ______________________________________________________________
      |  var button = querySelector('#confirm');                    |
      |  button.text = 'Confirm';                                   |
      |  button.classes.add('important');                           |
      |  button.onClick.listen((e) => window.alert('Confirmed!'));  |
      |_____________________________________________________________|

   *  Be careful to construct your cascade on a function that returns an actual object. For example, the following code fails:
   *  sb.write returns void thus it will return an error
      _____________________________
      |  var sb = StringBuffer();   |
      |  sb.write("Hello")          |
      |    ..write('world!');       |
      |_____________________________|

   */
  //------------------------------------------------------------------

  //TODO: Exceptions
  void breedMoreLlamas() => throw UnimplementedError();
  void buyMoreLlamas() {
    print('Buying more llamas');
    throw OutOfMemoryError();
  }

  void countMoreLlamas() => throw 'arbitary exception';
  try {
    //breedMoreLlamas();
    countMoreLlamas();
  } on UnimplementedError {
    try {
      buyMoreLlamas();
    } on OutOfMemoryError {
      print('OOM Error ');
    }
  } on Exception catch (e) {
    // Anything else in that exception
    print('Unknown exception: $e');
    countMoreLlamas();
  } catch (e) {
    // No specified type, hanles all
    print('Something really unknown: $e');
  }
}

//Lexical closure
//A closure is a function object that has access to variables in its lexical scope,
//even when the function is used outside of its original scope.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

/**
 //TODO: what is const?
 * "const" has a meaning that's a bit more complex and subtle in Dart.
 * const modifies values. You can use it when creating collections,
 * like const [1, 2, 3], and when constructing objects (instead of new) like const Point(2, 3).
 * Here, const means that the object's entire deep state can be determined entirely at compile time and
 * that the object will be frozen and completely immutable.
 *
 //TODO: why can't I use const without static?
 *  constant also doesn't need to be repeated for each instance.
 *  Since it is constant, it will never change, so why waste space duplicating it?
 */
