abstract class UniversityMember {
  void showDetails();
}

class Student implements UniversityMember {
  
  void showDetails() {
    print("Student details");
  }
}

class Faculty implements UniversityMember {
  
  void showDetails() {
    print("Faculty details");
  }
}

class Professor implements UniversityMember {
  
  void showDetails() {
    print("Professor details");
  }
}

class Staff implements UniversityMember {
  
  void showDetails() {
    print("Staff details");
  }
}


//Abstraction
