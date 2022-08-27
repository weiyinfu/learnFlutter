Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

void main() async {
  await for (var i in timedCounter(const Duration(seconds: 2), 10)) {
    print(i);
  }

  //直接使用periodic
  var counterStream = Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(15);
  counterStream
      //只要奇数
      .where((event) => event % 2 == 1)
      //将数字变成偶数
      .map((int x) => x * 2)
      //将一个元素扩展为多个元素
      .expand((element) => [element, element * 3])
      .forEach((element) {
    print(element);
  });
}

/// Splits a stream of consecutive strings into lines.
///
/// The input string is provided in smaller chunks through
/// the `source` stream.
Stream<String> lines(Stream<String> source) async* {
  // Stores any partial line from the previous chunk.
  var partial = '';
  // Wait until a new chunk is available, then process it.
  await for (final chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0]; // Prepend partial line.
    partial = lines.removeLast(); // Remove new partial line.
    for (final line in lines) {
      yield line; // Add lines to output stream.
    }
  }
  // Add final partial line to output stream, if any.
  if (partial.isNotEmpty) yield partial;
}
