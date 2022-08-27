import "dart:io";

void main() {
  Process.run("ls", [], runInShell: true).then((res) {
    stdout.writeAll([res.stdout, 'this is out']);
  });
  print("====");
  var res = Process.runSync("ls", []);
  print(res.stdout);

}
