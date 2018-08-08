import 'dart:async';

main() {
  //Using Future to adapt non-Future API
  final completer = Completer<String>();
  completer.future.then(print);
  completer.complete('Hello world, I am inside Completer');

  print('1');
  getInFuture2().then(print);
  getInFuture3().then(print);
  print('4');
  ////////////////////////////
}

Future<String> getInFuture2() => Future.value("2");

Future<String> getInFuture3() => Future.value("3");
