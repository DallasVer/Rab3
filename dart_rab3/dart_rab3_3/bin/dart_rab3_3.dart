import 'dart:io';

void main(List<String> arguments) {
  List<String> input = File("tabl.txt").readAsLinesSync();
 // List<String> conInput = input.readAsLinesSync();
 for (var line in input) {
    input = line.split(' ');
  }
   
  List<int> num = input.map(int.parse).toList();
  int volum = 0;
  var visot = 0;
  for (var i =0; i < num.length; i++){
    for (int j= 1+ i; j < num.length; j++){
      if (num[i] < num[j]){
        visot = num[i];
      }
      else {
        visot = num[j];
      }
      int lenght = j - i;
      if (volum < visot * lenght){
        volum = visot * lenght;
      } 
    }
  }
  print(volum);
}