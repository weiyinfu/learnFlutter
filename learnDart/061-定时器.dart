import 'dart:async';

void main() {
  var timer = Timer.periodic(Duration(seconds: 1), (timer) {
    print(DateTime.now());
  });

  //任务的定时执行。延迟1秒后输出f1
  Timer(Duration(milliseconds: 1000), () {
    print("f1");
  });
  int count = 0;
//任务的周期性执行
  Timer.periodic(Duration(milliseconds: 1000), (timer) {
    print("f2");
    count++;
    if (count == 3) {
      //当执行count=3时，取消timer中的任务
      timer.cancel();
    }
  });
//异步任务执行，输出f3
  Timer.run(() {
    print("f3");
  });
}
