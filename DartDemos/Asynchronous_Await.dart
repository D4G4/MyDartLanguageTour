import 'dart:async';
/*
Await expressions makes you write the asynchronous code almost as if it were synchronous.

Await expression has the form :
    await e
where e is a unary expression. Typically, e is an asynchronous computation and is expected to evaluate to a Future.

The await expression evaluates 'e', and then suspends the currently running function until the result is ready i.e.
until Future has completed.
 */

//In await expression, the value of expression is usually future and if it is not, then the value is automatically wrapped in a future.

/*
Todo: Why do they return a Future :
Future indicates a promise to return an object (everything in Dart is an object)
The value of await expression is that promised returned object.
 */

demo() async {
  return Stream.periodic(const Duration(seconds: 1), (_) => "Yay");
}

main() async {
  print("Async Test");
  print(await demo());
  print("Daksh");
}
