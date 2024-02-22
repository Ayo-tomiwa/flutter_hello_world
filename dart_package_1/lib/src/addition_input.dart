import 'dart:io';

void main() {
  print('Enter n1:');
  var n1 = int.parse(stdin.readLineSync()!);
  print('Enter n2:');
  var n2 = int.parse(stdin.readLineSync()!);

  var output = n1 + n2;
  print('n1 + n2 = $output');
}
