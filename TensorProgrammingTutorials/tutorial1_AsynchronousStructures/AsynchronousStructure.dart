///Dart on it's own is a single-threaded programming language
///If we do not go out of the way to spawn other threads with the use of [Isolates] then our code is fully single-threaded.

import 'dart:async';

main(List<String> args) async {
  loadStringWithoutAsyncAndAwait("Hello from dart").then((s) => print(s));

  //TODO: Try this
  //print(await loadStringWithoutAsyncAndAwait("Hello from dart"));

  //We are getting the value of the future from loadStringWithAsyncAndAway() with the help of async keyword.
  //It will automatically unwrap the Future object and return us the value.
  String str = await loadStringWithAsyncAndAwait("Hello from dart async");
  print(str);

  //Not that we have used `await` above, it will give use the permanence in the order and your code will wait rather than immediately
  //executing the below statements.

  //TODO: Try this
  //print(await loadStringWithAsyncAndAwait("Hello from dart async"));

  //It is worth noticing that `.then` sometimes causes unexpected behaviour,
  //for instance: If you won't call the above function and simply execute the below function,
  //the statements under this below function will get exectued first because your `loadStringWithAsyncAndAwait`
  //is as a time consuming function and has not been called with `await`
  loadStringWithAsyncAndAwait("Hello from async using .then").then(
    (s) => print(s),
  );

  addAsync(30)
      .then(
        (aFunction) => aFunction(50),
      )
      .then(
        (returnedValueFrom_aFunction) => print(returnedValueFrom_aFunction),
      );
  //Or
  Function x = await addAsync(50);
  int z = await x(40); //Because await automatically unwraps stuff
  print(z);
}

///[Future] is a means of getting a value or piece of data sometiemes in the future.
///So it's basically like creating a promise in the code that says "Okay, well eventually we will get a String(data)"
///The way it works under the hood:
///       loadString() will make a future and return it to main function where it will sit there uncompleted and later
///       when the value is available from this main fun, it will be pushed to that future object and that future obj will be copleted.
Future<String> loadStringWithoutAsyncAndAwait(String str) {
  return Future.delayed(Duration(seconds: 6)).then((_) {
    return "String: $str + 6 seconds";
  });
}

///So you can only use [await] inside of an [async]hronous function.
///Also, an [async] function naturally returns a future,
///so instead of creating a [Future] value, like we did in the previous function, we just simply
///return a String value and it will automatically put it in a different future object coz we are using [async] keyword.
///
/// TODO Imp. Point
/// So even if we are using a Future object inside this method, it is done only to delay the function.
/// the statement -> 'return "String: $str";' will automatically return a [Future] with a String value in it.
Future<String> loadStringWithAsyncAndAwait(String str) async {
  await Future.delayed(Duration(seconds: 2));
  return "String: $str + 2 seconds";
}

///Returns a closure function and closure itself is asynchronous.
Future<Function> addAsync(int x) async {
  return (int y) async => x + y;
}

/// Therefore:
/// Use Await -> Permenance of the order
/// Use then  -> Based on actual duration of computation rather than the order.
