class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  Bicycle(this.cadence, this.gear);

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
    print(toString());
  }

  void speedUp(int increment){
    _speed += increment;
     print(toString());
  }

  @override
  String toString() => 'Bicycle: speed @ $speed mph';
}

void main() {
  var bike1 = new Bicycle(4, 6);
  var bike = Bicycle(2, 1);
  print(bike1.toString());
  print(bike);
  bike.speedUp(40);
  bike.applyBrake(5);
}
