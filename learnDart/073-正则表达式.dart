void main() {
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

void test2() {
  var numbers = RegExp(r'\d+');
  var someDigits = 'llamas live 15 to 20 years';

// Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

// Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}
