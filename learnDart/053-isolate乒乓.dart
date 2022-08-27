import 'dart:isolate';

void main() async {
  final p = ReceivePort();
  Isolate.spawn(_readAndParseJson, p.sendPort).then((value) {
    print("done");
  });
  p.sendPort.send("pong");
}

void _readAndParseJson(SendPort message) {
  message.send("ping");
}
