/*
* Dart的泛型跟Java的泛型几乎是一致的。
* */
class Printer<T> {
  T? data;

  void printData() {
    print(this.data);
  }
}

void printData<T>(T t) {
  print(t);
}
void main(){

}