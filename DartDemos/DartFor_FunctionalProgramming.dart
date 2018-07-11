/*
 * In Dart,
 * even functions are objects and have a type, Function.
 * This means that functions can be assigned to variables or
 * passed as arguments to other functions.
 * You can also call an instance of a Dart class as if it were a function,
 */

class WannableFunction {
  String c = 'dennis';

  call(String a, String b, String c) => '$a $b ${this.c}';
}

String scream(int length) => "A${'a' * length}h!";

main() {
  var wf = WannableFunction();
  var out = wf("hi", "there", 'gang');
  print(out + "\n");

  final values = [1, 2, 3, 4, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  print('\n');
  values.map(scream).forEach(print);
  print('\n');
  values.map(scream).skip(1).take(3).forEach(print);
}
