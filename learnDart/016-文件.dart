import 'dart:io';

Future<void> main() async {
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
