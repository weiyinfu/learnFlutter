//变量定义
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
int? x = null; //可控类型
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

void main() {
  print(image);

  //流程控制语句
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  //lambda 表达式
  image.forEach((key, value) {
    print("${key}=>${value}");
    print("$key=>$value");
  });

  final alistOfInts = <int>[]; //list
  final aSetOfInts = <int>{}; //Set
  final aMap = <int, String>{}; //一个字典

  //dynamic类型可以接受任何类型的赋值，这给dart提供了动态语言的特性
  dynamic x = aMap;
  x = aSetOfInts;
  x = alistOfInts;
}
