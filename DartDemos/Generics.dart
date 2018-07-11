void main() {
  var names = List<dynamic>();
  names.addAll(['Seth', 'Kathy', 'Lars', 'LarryPo', 'LarryPo']);
  var nameSet = Set<String>.from(names);

  print(names);
  print(nameSet);

  assert(names is List<String>);
  assert(nameSet is Set<String>);
}