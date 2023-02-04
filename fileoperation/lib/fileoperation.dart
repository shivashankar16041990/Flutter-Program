import 'dart:io';

void main() async {
  File f = File("myfile.txt.txt");
  print(await f.readAsString());
  print(await f.exists());
  print("hi");
}
