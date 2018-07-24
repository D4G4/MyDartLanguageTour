import 'dart:async';
import 'dart:convert';
import 'dart:io';

main(List<String> args) async {
  File file = File("testFromFileDemo.txt");

  ///[IOSink] is like end point of the stream in which we are feeding the data into the stream
  ///which then gets pushed to the file.
  print(await file.exists());
  //if (await file.exists() == true) file.delete(recursive: true);

  //IOSink sink = file.openWrite();
  IOSink sink = file.openWrite(mode: FileMode.append);
  sink.add(
      utf8.encode("Hello from Dart at ${DateTime.now().toIso8601String()}\n"));

  ///Let's read from a file
  ///Now reading of a file returns bytes thus we need to create Stream of bytes.
  ///Which is a list of integers in dart
  Stream<List<int>> fileStream = file.openRead().asBroadcastStream();
  //Stream<List<int>> fileStream = file.openRead();   //[2]

  fileStream.listen((byte) => print(byte)); //[2]

  /*File outputFile = File("testFromFileDemo2.txt");
  if (await outputFile.exists() == true) outputFile.delete(recursive: true);
  IOSink outputSink = outputFile.openWrite(mode: FileMode.append);*/

  fileStream
      .transform(
        utf8.decoder,
      )
      .transform(LineSplitter())
      .listen((str) => print(str), //outputSink.add(utf8.encode(str)
          onDone: () => print(
              "Successfully fetched all the data from the file thus closing the stream."),
          onError: (e) => print("Unable to fetch all data ${e.toString()}"));
  fileStream.listen((byte) => print(byte));

  ///So what's going to happen if you won't use asBroadcaseStream() in line number 21 is
  ///the second listener will get triggered frist and then it will throw an error, but how?
  ///It's because our stream is a single subscription stream and bcz first listener gets applied after the second listener get applied
  ///because it has to transform (line 31,34) the data with two diffrent objects,
  ///and with Single Subscription Stream, we can listen to a stream only Once.
  ///However, with [BroadcaseStream] we don't get gurantee of the order of the data.

  await sink.flush();
  await sink.close();
}
