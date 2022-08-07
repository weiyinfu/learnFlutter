int sumUpToFive(int a, [int? b, int? c, int? d, int? e]) {
  int sum = a;
  if (b != null) sum += b;
  if (c != null) sum += c;
  if (d != null) sum += d;
  if (e != null) sum += e;
  return sum;
}

//默认参数
int sumUpToFiveDefaultValue(int a,
    [int b = 2, int c = 3, int d = 4, int e = 5]) {
  return 0;
}

// ···
int total = sumUpToFive(1, 2);
int otherTotal = sumUpToFive(1, 2, 3, 4, 5);

//命名参数
void printName(String firstName, String lastName, {String? middleName}) {
  print('$firstName ${middleName ?? ''} $lastName');
}

void testPrintName() {
  printName('Dash', 'Dartisan');
  printName('John', 'Smith', middleName: 'Who');
  // Named arguments can be placed anywhere in the argument list
  printName('John', middleName: 'Who', 'Smith');
}

void main() {
  print(total);
}
