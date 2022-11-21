import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:test/test.dart';

void main(List<String> arguments) {
  List<int> transforming(String bub_0) {
    // функция принимает стринг
    List<int> a = []; // создается пустой массив
    String bub = ""; // создается пустоая строка
    bool m = true; //бул м труе

    for (int i = 0; i < bub_0.length; i++) {
      //перебор строки
      while (bub_0[i] != " " && m) {
        //работает цикл пока текущий элемнт не пробел
        bub += bub_0[i];
        if (i < bub_0.length - 1) {
          //проверка есть ли следущее
          i++; //если есть то и++
        } else {
          m = false; //если нет то заканчиваем перебор
        }
      }
      a.add(int.parse(bub)); //добавляет число в массив
      bub = ""; //обнуляет временную переменную
    }
    return (a);
  }

  void main() async {
    final file = File('C:\\Users\\User\\Documents\\rab3.txt');
    var output = File('C:\\Users\\User\\Documents\\rab3.output.txt');
    Stream<String> lines = file
        .openRead() //читает файл
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()); // Convert stream to individual lines.
    List<String> ai = []; // создаем пустой массив, который принимает строки
    await for (var line in lines) {
      // перебирает строки
      ai.add(line); // каждую линию добавляют как отделаьный элемент массива
    }
    List<int> winning_numbers =
        transforming(ai[0]); // переводим первую строку в целочисленный массив
    List<int> numbers_tickets =
        transforming(ai[1]); // переводим первую строку в целочисленный массив
    var sink = output.openWrite(); //  открываем файл output.
    for (int i = 0; i < numbers_tickets[0]; i++) {
      //  проверка строк ( сколько будет тикетов, столько и строк )
      List<int> ticket = transforming(ai[i + 2]);
      int num =
          0; // создание пустой переменной, для того, сколько в текущем билете совпадающий чисел
      for (int n = 0; n < winning_numbers.length; n++) {
        for (int m = 0; m < ticket.length; m++) {
          if (ticket[m] == winning_numbers[n]) {
            num++; // нам ++ если число в тикете совпадает с правильным числом
          }
        }
      }

      if (num >= 3) {
        // если 3 числа совпадает
        sink.write('Lucky\n');
      } else
        sink.write('Unlucky\n');
    }
    sink.close(); // закрываем файл output.
  }
}
