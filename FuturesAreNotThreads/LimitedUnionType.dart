import 'dart:async';
import 'dart:convert';
import 'dart:io';

main() async {
  final feed1 = getFeedSize();
  if (feed1 is Future) {
    print('From RPC: ${await feed1} bytes.');
  }
  final feed2 = getFeedSize();
  if (feed2 is! Future) {
    print('From Cache: $feed2 bytes.');
  }
  exit(0);
}

int _cachedFeedSize;

/// Returns a `Future<int>` when reading from an RPC, or `int` from cache.
FutureOr<int> getFeedSize() {
  final Uri packagesAtom = Uri.parse('https://pub.dartlang.org/feed.atom');
  if (_cachedFeedSize != null) {
    return _cachedFeedSize;
  }
  return HttpClient()
      .getUrl(packagesAtom)
      .then((request) => request.close())
      .then(utf8.decodeStream)
      .then((bytes) => _cachedFeedSize = bytes.length);
}