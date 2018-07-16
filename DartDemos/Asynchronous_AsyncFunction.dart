/*
When an async function is called, a Future is immediately returned
and the body of the function is executed later.

As the body of that asynchronous function starts executing,
the Future returned by that function will be completed along with it's result.

When an asynchronous function is called, the immediate result is a Future.
It is a way of fetching a value for the function somewhat later in the future.

When a function that returns a Future is requested, the following action items occur:
  -> The work to be done is queued by the function and the output is an uncompleted Future.
  -> Later, when a value is available, the Future object completes with the latest value.
 */

demo() async {
  return 42;
}

main() {
  print("AsyncTest");
  demo().then((dynamic response) {
    print(response);
  });
}
