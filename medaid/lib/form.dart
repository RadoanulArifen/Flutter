import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;
  
  // Form values
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _email;
  String? _password;
  String? _confirmPassword;
  
  // Date of birth values
  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;
  
  // Error messages
  String? _dateOfBirthError;
  String? _termsError;

  // Password validation
  bool _isPasswordValid(String password) {
    // Check for minimum length of 6
    if (password.length < 6) return false;
    
    // Check for at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    
    // Check for at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    
    // Check for at least one special character
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    
    return true;
  }
  
  // Validate all fields including dropdowns and checkbox
  bool _validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    
    // Validate date of birth
    if (_selectedDay == null || _selectedMonth == null || _selectedYear == null) {
      setState(() {
        _dateOfBirthError = 'Please select a complete date of birth';
      });
      isValid = false;
    } else {
      setState(() {
        _dateOfBirthError = null;
      });
    }
    
    // Validate terms agreement
    if (!_agreeToTerms) {
      setState(() {
        _termsError = 'You must agree to the terms';
      });
      isValid = false;
    } else {
      setState(() {
        _termsError = null;
      });
    }
    
    return isValid;
  }
  
  void _submitForm() {
    if (_validateForm()) {
      // Form is valid, proceed with submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
      
      // Here you would typically send the data to your backend
      print('Form submitted with:');
      print('Name: $_firstName $_lastName');
      print('DOB: $_selectedDay/$_selectedMonth/$_selectedYear');
      print('Phone: $_phoneNumber');
      print('Email: $_email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                
                // First Name
                const Text('First Name'),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) => _firstName = value,
                  onChanged: (value) => _firstName = value,
                ),
                const SizedBox(height: 15),
                
                // Last Name
                const Text('Last Name'),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) => _lastName = value,
                  onChanged: (value) => _lastName = value,
                ),
                const SizedBox(height: 15),
                
                // Date of Birth
                const Text('Date of Birth'),
                const SizedBox(height: 5),
                Row(
                  children: [
                    // Day dropdown
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('dd'),
                            isExpanded: true,
                            value: _selectedDay,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: List.generate(31, (index) => index + 1)
                                .map((day) => DropdownMenuItem(
                                      value: day.toString().padLeft(2, '0'),
                                      child: Text(day.toString().padLeft(2, '0')),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedDay = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // Month dropdown
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('mm'),
                            isExpanded: true,
                            value: _selectedMonth,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: List.generate(12, (index) => index + 1)
                                .map((month) => DropdownMenuItem(
                                      value: month.toString().padLeft(2, '0'),
                                      child: Text(month.toString().padLeft(2, '0')),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedMonth = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // Year dropdown
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('yyyy'),
                            isExpanded: true,
                            value: _selectedYear,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: List.generate(100, (index) => DateTime.now().year - index)
                                .map((year) => DropdownMenuItem(
                                      value: year.toString(),
                                      child: Text(year.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedYear = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_dateOfBirthError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      _dateOfBirthError!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 15),
                
                // Phone Number
                const Text('Phone Number'),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value,
                  onChanged: (value) => _phoneNumber = value,
                ),
                const SizedBox(height: 15),
                
                // Email Address
                const Text('Email Address'),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                  onChanged: (value) => _email = value,
                ),
                const SizedBox(height: 15),
                
                // Password
                const Text('Password'),
                const SizedBox(height: 5),
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (!_isPasswordValid(value)) {
                      return 'Password must be at least 6 characters with uppercase, lowercase, and special character';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                  onChanged: (value) => _password = value,
                ),
                const SizedBox(height: 15),
                
                // Confirm Password
                const Text('Confirm Password'),
                const SizedBox(height: 5),
                TextFormField(
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) => _confirmPassword = value,
                  onChanged: (value) => _confirmPassword = value,
                ),
                const SizedBox(height: 15),
                
                // Terms and Conditions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                          if (_agreeToTerms) {
                            _termsError = null;
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('I agree to the terms of user'),
                          if (_termsError != null)
                            Text(
                              _termsError!,
                              style: const TextStyle(color: Colors.red, fontSize: 12),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}