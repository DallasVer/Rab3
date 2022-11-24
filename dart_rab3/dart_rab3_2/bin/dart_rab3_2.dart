import 'dart:io';

void main() {
  var nums = File("nums.txt");
  var nan = nums.openWrite();
  var conNums = nums.readAsLinesSync();
  List<String> num = conNums;
  num.clear();
}
