//Builder pattern according to Java
class Computer {
  //required parameters
  String _HDD;
  String _RAM;

  //optional parameters
  bool _isGraphicsCardEnabled;
  bool _isBluetoothEnabled;

  String get hdd => _HDD;

  String get ram => _RAM;

  bool get isGraphicsCardEnabled => _isGraphicsCardEnabled;

  bool get isBluetoothEnabled => _isBluetoothEnabled;

  Computer(ComputerBuilder builder) {
    this._HDD = builder.HDD;
    this._RAM = builder.RAM;
    this._isGraphicsCardEnabled ??= builder.isGraphicsCardEnabled;
    this._isBluetoothEnabled = builder.isBluetoothEnabled;
  }

  @override
  String toString() {
    return '''
    HDD: $_HDD
    RAM: $_RAM
    HasGraphicsCard? : $_isGraphicsCardEnabled
    HasBluetooth?    : $_isBluetoothEnabled
    ''';
  }
}

//Builder Class
class ComputerBuilder {
  //required parameters
  String HDD;
  String RAM;

  //optional parameters
  bool isGraphicsCardEnabled;
  bool isBluetoothEnabled;

  ComputerBuilder(this.HDD, this.RAM,
      {this.isGraphicsCardEnabled: false, this.isBluetoothEnabled});

  ComputerBuilder enableGraphicsCard(bool isGraphicsEnabled) {
    this.isGraphicsCardEnabled = isGraphicsEnabled;
    return this;
  }

  ComputerBuilder enableBluetooth(bool isBluetoothEnabled) {
    this.isBluetoothEnabled = isBluetoothEnabled;
    return this;
  }

  Computer build() {
    return new Computer(this);
  }

//Notice that Computer class has only getter methods and no public constructor.
// So the only way to get a Computer object is through the ComputerBuilder class.
}

void main() {
  //Using builder to get the object in single line of  code and
  //without any inconsistent state or arguments management issues
  var HDD = "500GB";
  var RAM = "DDR4 4GB";

  Computer comp = new ComputerBuilder(HDD, RAM)
      .enableBluetooth(true)
      .build();

  print(comp.toString());
}
