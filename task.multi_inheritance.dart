mixin EventOrganizer {
  void organizeEvent() {
    print("Organizing an event");
  }
}

class Faculty with EventOrganizer {
  
}

class Student with EventOrganizer {
  
}

void main() {
  Faculty faculty = Faculty();
  Student student = Student();

  faculty.organizeEvent(); 
  student.organizeEvent(); 
}