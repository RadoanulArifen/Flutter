
//Encapsulation(Data Hiding)
class Person {
  String _name;  
  int _age;
  int _id;


  Person(this._name, this._age, this._id) {
    if (_age < 18) {
      print("Age must be at least 18.");
    }
  }


  String get name => _name;
  set name(String newName) => _name = newName;


  int get age => _age;


  void showDetails() {
    print("Name: $_name, Age: $_age, ID: $_id");
  }
}

//Single Inheritance
class Student extends Person {
  String department;
  double cgpa;


  Student(String name, int age, int id, this.department, this.cgpa)
      : super(name, age, id);

  
 
  void showDetails() {
    print("Student: $name, Department: $department, CGPA: $cgpa");
  }
}


class Faculty extends Person {
  String subject;
  double salary;


  Faculty(String name, int age, int id, this.subject, this.salary)
      : super(name, age, id);


  @override
  void showDetails() {
    print("Faculty: $name, Subject: $subject, Salary: \$$salary");
  }
}

//Multilevel Inheritance
class Professor extends Faculty {
  String researchArea;


  Professor(String name, int age, int id, String subject, double salary, this.researchArea)
      : super(name, age, id, subject, salary);

  
 
  void showDetails() {
    print("Professor: Dr. $name, Research Area: $researchArea, Subject: $subject");
  }
}

//Hierarchical Inheritance
class Staff extends Person {
  String role;
  int workingHours;

   
  Staff(String name, int age, int id, this.role, this.workingHours) : super(name, age, id);

  
  
  void showDetails() {
    print("Staff: $name, Role: $role, Works for $workingHours hours");
  }
}

//Mixin for Multiple Inheritance
mixin EventOrganizer {
  void organizeEvent() {
    print("${this.runtimeType} is organizing an event!");
  }
}

// Applying mixin to Faculty and Student
class EventFaculty extends Faculty with EventOrganizer {
  EventFaculty(String name, int age, int id, String subject, double salary)
      : super(name, age, id, subject, salary);
}

class EventStudent extends Student with EventOrganizer {
  EventStudent(String name, int age, int id, String department, double cgpa)
      : super(name, age, id, department, cgpa);
}

