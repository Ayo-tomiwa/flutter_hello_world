import 'dart:io';

int add(int x, int y) {
  return x + y;
}

int subtract(int x, int y) {
  return x - y;
}

int multiply(int x, int y) {
  return x * y;
}

double divide(int x, int y) {
  if (y != 0) {
    return x / y.toDouble();
  } else {
    print("Error: Division by zero.");
    return double.nan; // Not-a-Number
  }
}

Function(int, int) calculation(String op) {
  if (op == '+') return add;
  if (op == '-') return subtract;
  if (op == '*') return multiply;
  if (op == '/') return divide;
  throw ArgumentError("Invalid operation");
}

void main() {
  stdout.write("Enter the first number: ");
  var x = int.parse(stdin.readLineSync()!);

  stdout.write("Enter the second number: ");
  var y = int.parse(stdin.readLineSync()!);

  stdout.write("Choose an operation (+, -, *, /): ");
  var operation = stdin.readLineSync()!;

  var fn = calculation(operation);
  var result = fn(x, y);
  if (!result.isNaN) {
    print("Result: $x $operation $y = $result");
  }
}
