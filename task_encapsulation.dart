class Person {
  String _name;
  int _age;
  String _id;

  Person(this._name, this._age, this._id);


  String get name => _name;

  set name(String name) {
    _name = name;
  }


  int get age => _age;


  set age(int age) {
    if (age > 18) {
      _age = age;
    } else {
      throw Exception('Age must be greater than 18');
    }
  }


  String get id => _id;


  set id(String id) {
    _id = id;
  }
}

void main() {
  Person person = Person('John Doe', 25, '12345');
  print('Name: ${person.name}');
  print('Age: ${person.age}');
  print('ID: ${person.id}');

  person.name = 'Jane Doe';
  person.age = 30;
  person.id = '67890';

  print('Updated Name: ${person.name}');
  print('Updated Age: ${person.age}');
  print('Updated ID: ${person.id}');
}
