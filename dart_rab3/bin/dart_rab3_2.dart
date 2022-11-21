import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:math';

void main(List<String> async {
  final file = File('file.txt');

  var length = await file.length();
  print(length);}
