mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class Spacecraft {
  void fly() {
    print("i am flying");
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
}

void main() {
  var x = PilotedCraft();
  x.describeCrew();
  x.fly();
}
