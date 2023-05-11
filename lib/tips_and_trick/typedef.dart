typedef IntOperation<int> = int Function(int a, int b);
typedef RequestBody = Map<String, dynamic>;

int processTwoInts(IntOperation<int> intOperation, int a, int b) {
  return intOperation(a, b);
}

class MyClass {
  int value;
  IntOperation<int> intOperation;

  MyClass(this.value, this.intOperation);

  int doIntOperation(int a, int b) {
    return this.intOperation(a, b);
  }
}

void main() {
  IntOperation<int> sumTwoNumbers = (int a, int b) => a + b;
  final RequestBody requestBody1 = {
    'type': 'BUY',
    'itemId': 2,
    'amount': 200,
  };

  print(sumTwoNumbers(2, 2));
  print(processTwoInts(sumTwoNumbers, 2, 1));

  MyClass myClass = MyClass(2, sumTwoNumbers);
  print(myClass.doIntOperation(4, 4));
}
