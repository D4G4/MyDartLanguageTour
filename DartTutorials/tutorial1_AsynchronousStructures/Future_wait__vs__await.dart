import 'dart:async';

main() async {
  performStopwatchOperation();

}

void performStopwatchOperation() async {
  Stopwatch stopwatch1 = Stopwatch()..start();
  var asyncResult1 = await asyncFunc1();
  var asyncResult2 = await asyncFunc2();
  print(asyncResult2);
  print('await() executed in ${stopwatch1.elapsed}');

  Stopwatch stopwatch2 = Stopwatch()..start();
  var list =  await Future.wait([asyncFunc1(),asyncFunc2()]);
  print(list[1]);
  print('Future.wait() executed in ${stopwatch2.elapsed}');
}

Future<String> asyncFunc1() async {
  return Future.delayed(const Duration(seconds: 1), () => "async return 1");
}

Future<String> asyncFunc2() async {
  return Future.delayed(const Duration(seconds: 1), () => "async return 2");
}

Future<String> asyncFunc3() async {
  return Future.delayed(const Duration(seconds: 1), () => "async return 3");
}
