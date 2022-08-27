import 'dart:io';

void main() {
  if (3 > 2) {
    throw StateError('No astronauts.');
  }
  try {
    print("do something here");
  } on IOException catch (e) {
    //捕捉默认异常
    print('Could not describe object: $e');
  } catch (e) {
    //捕捉所有异常
  } finally {}
}
