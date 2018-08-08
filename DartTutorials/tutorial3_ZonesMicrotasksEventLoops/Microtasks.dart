///Because Dart is SingleThreaded, we come across a lot of Asynchronous code.
///Many library functions return [Future] objects and
///you can register handlers to respond to those events(mouse clicks, file IO completions etc)
///Dart function can't be interrupted by another Dart code.
///
/// Now, dart has 2 Queues and 1 EventLoop
/// 2 Queues = We have an [EventQueue] and the [MicroTask] queue.
///                       [EventQueue] typically handles outside events  (IO, mouse clicks, timers, messages from isolates)
///                       [MircoTask] is built on top of it for different parts that need that specific type of functionality.

import 'dart:async';

main() async {
  print("Top of Main Function");

  Future.delayed(
    Duration(milliseconds: 500),
    () => print("Future"),
  );

  scheduleMicrotask(
    () => print("Microtask Queue #1"),
  );

  Future(() => print('From future two'));

  scheduleMicrotask(() => print("Microtask Queue #2"));

  print("Bottom of Main function");
}
