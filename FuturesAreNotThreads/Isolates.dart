import 'dart:async';
import 'dart:isolate';

main() async {
  //Compute and print a fibonacci sequence synchronously
  print(synchronousFibonacci(5));

  //Compute and print fibonacci sequence on another thread
  print(await asynchronousFibonacci(20));
}

///Create a [ReceivePort] and pass that ReceivePort's [SendPort] inside spawn()
///Any message that will be sent through this sendPort will be delivered to this ReceivePort.
///*See documentation for more*
///
///Now get the [SendPort] from the [ReceivePort] created inside your function in Isolate
///#receivedSendPortFromIsolate
///and pass a new [ReceivePort] to that sendPort as a message so that 
///when that ReceivePort (inside isloate) will listen to this message, 
///it will respond via that passed [ReceivePort]
///
Future<dynamic> asynchronousFibonacci(int n) async {
  final receivePort = new ReceivePort();
  print(receivePort.sendPort.hashCode);
  //passing a sendPort so Spannwer and Spawnee can communicate with each other
  await Isolate.spawn(
      initialFunctionToBeCalledInTheSpawnedIsolate, receivePort.sendPort)
      .whenComplete(() => print("success"));
  final receivedSendPortFromIsolate = await receivePort.first as SendPort;
  //final SendPort receivedSendPortFromIsolate = await receivePort.first as SendPort;
  final answer = ReceivePort();
  print('Sending message to isolate');
  receivedSendPortFromIsolate.send([n, answer.sendPort]);
  return answer.first;
}

///Expected to be created via [Isolate.spawn]
///
///Sends a [ReceivePort] to above ReceivePort's sendPort, waiting for a message that
///includes a value for [_fibonacci] and a [SendPort] to respond via.
///
void initialFunctionToBeCalledInTheSpawnedIsolate(SendPort receivePortSendPort) {
  print(receivePortSendPort.hashCode);
  final receivePort = ReceivePort();
  print("Initially replying to ");
  receivePortSendPort.send(receivePort.sendPort);
  print("Okay, no I'm listening");
  receivePort.listen((message) {
    final data = message[0] as int;
    final sendPort = message[1] as SendPort;
    print('Sending back');
    sendPort.send(synchronousFibonacci(data));
  });
}

int synchronousFibonacci(int n) {
  return n < 2 ? n : synchronousFibonacci(n - 1) + synchronousFibonacci(n - 2);
}
