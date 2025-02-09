class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String name) {
    _name = name;
  }

  // Getter for age
  int get age => _age;

  // Setter for age
  set age(int age) {
    if (age > 0) {
      _age = age;
    } else {
      print('Age must be positive');
    }
  }
}

void main() {
  Person person = Person('John', 30);
  print('Name: ${person.name}, Age: ${person.age}');

  person.name = 'Doe';
  person.age = 35;
  print('Name: ${person.name}, Age: ${person.age}');

  person.age = -5; // This will print an error message
}