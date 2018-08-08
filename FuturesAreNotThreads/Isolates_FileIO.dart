import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

const String example1Json =
    "/home/daksh/IdeaProjects/DartLanguageTour/FuturesAreNotThreads/example_1.json";
main() async {
  //Reads and decodes a file synchronously
  print(readSync());

  //Reads a file asynchronously and then decodes it
  print(await readAsync());

  //Reads a file synchronously in other isolate and then decodes it.
  print(await readIsolate());
}

//  Reads file synchronously (in the same threa)
Map readSync() => jsonDecode(File(example1Json).readAsStringSync());

//  Reads file asynchronously (in another thread managed by the VM)
Future<Map> readAsync() async =>
    jsonDecode(await File(example1Json).readAsString());

Future<dynamic> readIsolate() async {
  final response = ReceivePort();
  await Isolate.spawn(_myIsolate, response.sendPort);
  return response.first;
}

/// Expected to be created via [Isolate.spawn]
void _myIsolate(SendPort sendPort) {
  sendPort.send(readSync());
}
