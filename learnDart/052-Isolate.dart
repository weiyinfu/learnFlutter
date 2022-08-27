import 'dart:convert';
import 'dart:isolate';
import 'dart:io';

void main() async {
  // Read some data.
  final jsonData = await _parseInBackground();

  // Use that data
  print('Number of JSON keys: ${jsonData.length}');
}

// Spawns an isolate and waits for the first message
Future<Map<String, dynamic>> _parseInBackground() async {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJson, p.sendPort);
  return await p.first as Map<String, dynamic>;
}

Future<void> _readAndParseJson(SendPort p) async {
  final fileData = await File('haha.json').readAsString();
  final jsonData = jsonDecode(fileData);
  Isolate.exit(p, jsonData);
}
