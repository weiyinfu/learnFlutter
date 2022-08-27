import 'dart:io';
import 'dart:convert';

test1() async {
  final process = await Process.start('ls', ['-l']);
  final lineStream = process.stdout.transform(const Utf8Decoder()).transform(const LineSplitter());

  await for (final line in lineStream) {
    print(line);
  }

  await process.stderr.drain();
  print('exit code: ${await process.exitCode}');
}

test2() {
  Process.start("top", [], runInShell: true).then((res) {
    print("process started");
    stdout.addStream(res.stdout);
  });
  print("before sleep");
}

testAdblog() {
  Process.start("adb", ['logcat'], runInShell: true).then((p) {
    print("started");
    p.stderr.transform(Utf8Decoder()).transform(LineSplitter()).forEach((element) {
      print(element);
    });
    p.stdout.transform(Utf8Decoder(allowMalformed: true)).transform(LineSplitter()).forEach((line) {
      print(line);
    });
  });
}

void main() async {
  // test2();
  testAdblog();
}
