import 'dart:convert';
import 'dart:io';

test1() async {
  try {
    var filename = "haha";
    var file = File('$filename.txt');
    if (await file.exists()) {
      var modified = await file.lastModified();
      print('File for $filename already exists. It was modified on $modified.');
      return;
    }
    await file.create();
    await file.writeAsString('Start describing $filename in this file.');
  } on IOException catch (e) {
    print('Cannot create description for $e');
  }
}

test2() async {
  //类似python中的__file__
  var file = File(Platform.script.toFilePath());
  print(await (file.readAsString(encoding: utf8)));
}

test3() async {
  final semicolon = ';'.codeUnitAt(0);
  final result = <int>[];

  final script = File(Platform.script.toFilePath());
  RandomAccessFile file = await script.open(mode: FileMode.read);

  // Deal with each byte.
  while (true) {
    final byte = await file.readByte();
    result.add(byte);
    if (byte == semicolon) {
      print(String.fromCharCodes(result));
      await file.close();
      break;
    }
  }
}

void test4() async {
  final result = <int>[];

  Stream<List<int>> stream = File(Platform.script.toFilePath()).openRead();
  final semicolon = ';'.codeUnitAt(0);

  await for (final data in stream) {
    for (int i = 0; i < data.length; i++) {
      result.add(data[i]);
      if (data[i] == semicolon) {
        print(String.fromCharCodes(result));
        return;
      }
    }
  }
}

void main() {
  test2();
}
