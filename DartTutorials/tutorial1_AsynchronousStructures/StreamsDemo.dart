import 'dart:async';

///[Stream]s provide us a way of accessing asynchronous sequences of data.
///Think of it as an "Asynchronous Iterator"
///These "Sequences" can be
///         -> User generate events
///         -> Response from an API
///         -> Reading from files

/// One of the easist way to deal with stream is to use `await for` loop, 
/// sort of like "Async for loop"
main(List<String> args) async {
  ///await for loop
  Stream simpleStream = exampleStream(5);
  await for (var s in simpleStream) {
    print("Number: $s");
  }

  //Another way
  exampleStream(5).listen((int x) => print("Number: $x"));
  ///So what a Listener does is, it attaches a callback function to the stream and every single time a String emmits an event or data,
  ///this callback function((int x) => print("Number: $x") is called on this piece of data.
  print("Test");
  print("Test");
  print("Test");
  print("Test");
  print("Test");
  print("Test");
  print("Test");
}

/// Simple [Stream] generator
/// So this "generator" is a function that uses `async*` and 
/// then `yield` as the return statement.
Stream<int> exampleStream(int x) async* {
  for (int i = 0; i < x; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;
  }
}
