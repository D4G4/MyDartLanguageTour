import 'dart:async';
import 'dart:io';

Future main() async {
  HttpServer server;

  try {
    server = await HttpServer.bind('127.0.0.1', 8080);
  } catch (e) {
    print('failed to start server $e');
    exit(-1);
  }

  print('Listening on Localhost:${server.port}');

  await for (var req in server) {
    ///Get the requestUri
    ///Split them into strings and put them into as list AKA pathSegments
    ///then get the last item of that list.
    print(req.uri.pathSegments.last);

    HttpResponse response = req.response
      ..headers.contentType = ContentType.html;

    if (req.method == 'GET') {
      String fileName = req.uri.pathSegments.last;

      if (!fileName.contains('.html')) {
        fileName = fileName + '.html';
      }

      File file = File(fileName);
      if (await file.exists()) {
        file.openRead().pipe(response);
      } else {
        //Make a file and serve it
        file
            .openWrite(mode: FileMode.write)
            .write("<h1>This is a new file </h1>");

        file.openRead().pipe(response);
      }
    }
  }
}
