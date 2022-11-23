import 'dart:io';

void main() {
  var input = File("input.txt");
  var result = File("output.txt").openWrite();
  var conInput = input.readAsLinesSync();
  List<String> num = conInput;
  List<String> Lucky = num[0].split(" ");
  int b = 2;
  for (int f = 0; f < int.parse(num[1]); f++){
    int k = 0;
    List<String> bil = num[b].split(" ");
    for (int i = 0; i < Lucky.length; i++){
      for (int g = 0; g < 5; g++){
        if(Lucky[i] == bil[g]){
          ++k;
        }
        else{
          k = k;
        }
      }
    } 
  
  ++b;
  if (k >= 3){
    print("Lucky");
    result.write("Lucky\n");
    }
    else{
      print("Unlucky");
      result.write("Unlucky\n");
    }
  }
  ++b;
}
