class Person {
  final String name;

  Person(this.name);
}

class Employee extends Person {
  final int salary;

  Employee(this.salary, super.name);
}
