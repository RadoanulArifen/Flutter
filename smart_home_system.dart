class base{
  void smrt_home(){
    print("This is a smart home system");
  }
}

class light extends base {
  @override
  void smrt_home() {
    print("This is a light class");
  }
}

class fan extends base {
  @override
  void smrt_home() {
    print("This is a fan class");
  }
}

class security_camera extends base {
  @override
  void smrt_home() {
    print("This is a security camera class");
  }
}

class smart_door extends base {
  @override
  void smrt_home() {
    print("This is a smart door class");
  }
}


mixin SecurityFeatures {
  void enableSecurity() {
    print("Security features enabled");
  }
}

class smart_door_with_security extends smart_door with SecurityFeatures {
  @override
  void smrt_home() {
    super.smrt_home();
    enableSecurity();
  }
}

//encapsulation
mixin DeviceSettingsProtection {
  void protectSettings() {
    print("Device settings are protected from unauthorized changes");
  }
}

class smart_door_with_security_and_protection extends smart_door_with_security with DeviceSettingsProtection {
  @override
  void smrt_home() {
    super.smrt_home();
    protectSettings();
  }
}

//inheritance
mixin CommonFunctionalities {
  void turnOn() {
    print("Device is turned on");
  }

  void turnOff() {
    print("Device is turned off");
  }
}

class light_with_common extends light with CommonFunctionalities {
  @override
  void smrt_home() {
    super.smrt_home();
    turnOn();
  }
}

class fan_with_common extends fan with CommonFunctionalities {
  @override
  void smrt_home() {
    super.smrt_home();
    turnOn();
  }
}

class security_camera_with_common extends security_camera with CommonFunctionalities {
  @override
  void smrt_home() {
    super.smrt_home();
    turnOn();
  }
}

class smart_door_with_common extends smart_door with CommonFunctionalities {
  @override
  void smrt_home() {
    super.smrt_home();
    turnOn();
  }
}

//multilevel inheritance
class smart_door_with_all_features extends smart_door_with_security_and_protection with CommonFunctionalities {
  @override
  void smrt_home() {
    super.smrt_home();
    turnOn();
  }
}

void testPolymorphism(Operable device) {
  device.operate();
}



//polymorphism
abstract class Operable {
  void operate();
}

class light_with_operation extends light implements Operable {
  @override
  void operate() {
    print("Light is operating");
  }
}

class fan_with_operation extends fan implements Operable {
  @override
  void operate() {
    print("Fan is operating");
  }
}

class security_camera_with_operation extends security_camera implements Operable {
  @override
  void operate() {
    print("Security camera is operating");
  }
}

class smart_door_with_operation extends smart_door implements Operable {
  @override
  void operate() {
    print("Smart door is operating");
  }
}

//abstraction
abstract class EssentialFunctionalities {
  void essentialFunctionality();
}

class light_with_essential extends light implements EssentialFunctionalities {
  @override
  void essentialFunctionality() {
    print("Essential functionality for light");
  }
}

class fan_with_essential extends fan implements EssentialFunctionalities {
  @override
  void essentialFunctionality() {
    print("Essential functionality for fan");
  }
}

class security_camera_with_essential extends security_camera implements EssentialFunctionalities {
  @override
  void essentialFunctionality() {
    print("Essential functionality for security camera");
  }
}

class smart_door_with_essential extends smart_door implements EssentialFunctionalities {
  @override
  void essentialFunctionality() {
    print("Essential functionality for smart door");
  }
}



void main() {
  base myLight = light_with_operation();
  base myFan = fan_with_operation();
  base myCamera = security_camera_with_operation();
  base myDoor = smart_door_with_operation();

  myLight.smrt_home();
  (myLight as Operable).operate();

  myFan.smrt_home();
  (myFan as Operable).operate();

  myCamera.smrt_home();
  (myCamera as Operable).operate();

  myDoor.smrt_home();
  (myDoor as Operable).operate();
}






