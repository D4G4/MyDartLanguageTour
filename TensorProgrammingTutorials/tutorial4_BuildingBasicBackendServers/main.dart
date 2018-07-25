import 'dart:async';
import 'dart:io';
import 'dart:convert';

Future main() async {
  //await makeFile();
  await startServer();
}

Future startServer() async {
  File file = File("index.html");
  HttpServer server;
  try {
    server = await HttpServer.bind(
      '127.0.0.1',
      8080,
    );
    print('Listening on localhost:${server.port}');
  } on SocketException {
    print('Socket Exception, to fix this\n');
    File errorMessageFile =
        File("FixThisSocketExceptionMessage.txt");
    if (await errorMessageFile.exists()) {
      await errorMessageFile.open(mode: FileMode.read);
      Stream<List<int>> byteStream = errorMessageFile.openRead();
      /*byteStream
          .transform(
            utf8.decoder,
          )
          .transform(
            LineSplitter(),
          )
          .listen((str) => print(str),
              onError: (e) => print("Server port already open"));*/
      byteStream.listen((byte) => print(utf8.decode(byte)));

    }else{
      print("Server port already open");
    }
  } catch (e) {
    print('failed to start server $e');
  }

  await for (var httpRequest in server) {
    if (await file.exists()) {
      print('Serving ${file.path}');
      httpRequest.response..headers.contentType = ContentType.html;
      try {
        await file.openRead().pipe(httpRequest.response);
      } catch (e) {
        print("Couldn't read file $e");
        exit(-1);
      }
    }
  }

  ///Now, the [Server] object is basically a [Stream] of [HttpRequest] objects that are
  ///passed back and forth through the server.
  if (server != null)
    server.listen((HttpRequest request) {
      /*
    request.response.write("This is some text");
    request.response.close();
    */
      request.response
        ..write('<h1>This is some Texttt</h1>')
        ..close();
    });
}

Future makeFile() async {
  final File file = File('index.html');
  IOSink ioSink = file.openWrite(mode: FileMode.write);
  await ioSink.flush();
  await ioSink.close();
}
