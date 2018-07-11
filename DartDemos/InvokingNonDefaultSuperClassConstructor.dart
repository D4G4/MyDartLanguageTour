class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  //initialize instance variables before the constructor body runs
  Person.fromJson(Map data)
      : firstName = data['firstName'],
        lastName = data['lastName'] {
    print('in Person $firstName $lastName');
  }

  //Redirecting constructors can't have a body
  Person.redirectToMainConstructor(Map data) : this.fromJson(data);
}

class Employee extends Person {
  //Person does not have a default constructor (0 argument constructor) ;
  // you must call super.fromJson(data);
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }

  //Because the arguments to the superclass constructor are evaluated BEFORE invoking the sub-class's constructor,
  //an argument can be an expression such as a function call:
  Employee() : super.fromJson(getDefaultData());

  //Arguments to the superclass constructor do not have access to 'this'.
  //For example, arguments can call static methods but not instance methods.
  static Map<String, dynamic> getDefaultData() {
    return {'firstName': 'Dakshhh'};
  }
}

void main() {
  Map data = {'firstName': 'Daksh', 'lastName': 'Gargas'};
  var emp = Employee.fromJson(data);
  var emp1 = Employee();

  var p = Person.redirectToMainConstructor(data);

  ImmutablePoint immutablePoint = ImmutablePoint.origin;
  print(immutablePoint.x);
  print(immutablePoint.y);

  var immutablePoint1 = ImmutablePoint(21, 22);
  print(immutablePoint1.x);
  print(immutablePoint1.y);
}

//Constant constructors
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}
