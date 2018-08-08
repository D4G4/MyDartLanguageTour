import 'dart:async';

main() async {
  //1
  print('\n1');
  asyncFunc1().then((_) => asyncFunc2().then((result) {
        print(result);
      }));

  //2
  print('\n2');
  var asyncResult1 = await asyncFunc1();
  var asyncResult2 = await asyncFunc2();
  print(asyncResult2);

  //3   Try adding functions which takes some time.
  print('\n3  Using Future.wait');
  var list = await Future.wait([asyncFunc1(), asyncFunc2()]);
  print(list[1]);

  //4   Try using Stream here
  print('\n4  Using asStream -> asyncMap');
  Stream async1Stream = asyncFunc1().asStream();
  async1Stream.asyncMap((stringValue) {
    print(stringValue);
    asyncFunc2();
  }).listen((async2Result) {
    print(asyncResult2);
  });

  //5
  print('\n5  using asStream -> asyncMap ---  await for');
  var stream = asyncFunc1().asStream().asyncMap((_) => asyncFunc2());
  await for (var result in stream) {
    print(result);
  }

  //6   asyncExpand -> Transforms each element into sequence of asynchronous events.
  //                   Then convert() is called on each element and converts it into Stream
  print('\n6  using asStream -> asyncExpand');
  asyncFunc1()
      .asStream()
      .asyncExpand((_) => asyncFunc2().asStream())
      .listen((result) => print(result));

  //7
  asyncFunc1().asStream().asyncExpand((_) async* {
    yield await asyncFunc2();
  }).listen((result) {
    print(result);
  });
}

Future<String> asyncFunc1() async {
  //print("Inside asyncFunc1");
  return "async return1";
}

Future<String> asyncFunc2() async {
  return "async return2";
}
