import 'dart:math';

const CIRCLE = 'circle';
const SQUARE = 'square';

abstract class Shape {
  //Option2: Create a factory constructor
  factory Shape(String type) {
    if (type == CIRCLE) return Circle(2);
    if (type == SQUARE) return new Square(2);
    throw 'Can\'t create $type';
  }

  num get area;
}

//Option 1: Implementing top level function
Shape shapeFactory(String type) {
  switch (type) {
    case CIRCLE:
      return Circle(5);
      break;
    case SQUARE:
      return Square(5);
      break;
    default:
      throw "Can't create $type";
  }
}

class Circle implements Shape {
  final num radius;

  Circle(this.radius);

  num get area =>
      pi * pow(radius, 2); //Defining variable and it's getter method
}

class CircleMock implements Circle {
  num area;
  num radius;
}

class Square implements Shape {
  final num side;

  Square(this.side);

  num _area; // ignore: unused_field
  get area => pow(side, 2);
}

//How to declare circle outside the score and access it
main() {
  try {
    //Option1
    final circle1 = shapeFactory(CIRCLE);
    final square1 = shapeFactory(SQUARE);
    print(circle1.area);
    print(square1.area);
    //final rect = shapeFactory("rectangle");   //exception

    //Option2
    final circle2 = Shape(CIRCLE);
    final square2 = Shape(SQUARE);
    print(circle2.area);
    print(square2.area);
  } catch (err) {
    print(err);
  }
}
