import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
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
        fontFamily: 'Roboto',
      ),
      home: const DoctorListPage(),
    );
  }
}

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({Key? key}) : super(key: key);

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  String _selectedSpecialty = 'All';
  final List<String> _specialties = [
    'All',
    'Cardiology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'Dermatology',
    'Ophthalmology',
  ];

  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. Sarah Johnson',
      'designation': 'Senior Cardiologist',
      'department': 'Cardiology',
      'rating': 4.9,
      'experience': '15 years',
      'isOnline': true,
      'image': 'assets/doctor1.jpg',
    },
    {
      'name': 'Dr. Michael Chen',
      'designation': 'Neurologist',
      'department': 'Neurology',
      'rating': 4.7,
      'experience': '10 years',
      'isOnline': true,
      'image': 'assets/doctor2.jpg',
    },
    {
      'name': 'Dr. Emily Rodriguez',
      'designation': 'Orthopedic Surgeon',
      'department': 'Orthopedics',
      'rating': 4.8,
      'experience': '12 years',
      'isOnline': false,
      'image': 'assets/doctor3.jpg',
    },
    {
      'name': 'Dr. James Wilson',
      'designation': 'Pediatrician',
      'department': 'Pediatrics',
      'rating': 4.9,
      'experience': '14 years',
      'isOnline': true,
      'image': 'assets/doctor4.jpg',
    },
    {
      'name': 'Dr. Sophia Lee',
      'designation': 'Dermatologist',
      'department': 'Dermatology',
      'rating': 4.6,
      'experience': '8 years',
      'isOnline': false,
      'image': 'assets/doctor5.jpg',
    },
    {
      'name': 'Dr. Robert Taylor',
      'designation': 'Ophthalmologist',
      'department': 'Ophthalmology',
      'rating': 4.7,
      'experience': '11 years',
      'isOnline': true,
      'image': 'assets/doctor6.jpg',
    },
    {
      'name': 'Dr. Olivia Martinez',
      'designation': 'Cardiologist',
      'department': 'Cardiology',
      'rating': 4.5,
      'experience': '7 years',
      'isOnline': true,
      'image': 'assets/doctor7.jpg',
    },
    {
      'name': 'Dr. William Brown',
      'designation': 'Neurologist',
      'department': 'Neurology',
      'rating': 4.8,
      'experience': '13 years',
      'isOnline': false,
      'image': 'assets/doctor8.jpg',
    },
    {
      'name': 'Dr. Emma Davis',
      'designation': 'Orthopedic Surgeon',
      'department': 'Orthopedics',
      'rating': 4.7,
      'experience': '9 years',
      'isOnline': true,
      'image': 'assets/doctor9.jpg',
    },
    {
      'name': 'Dr. Daniel Kim',
      'designation': 'Pediatrician',
      'department': 'Pediatrics',
      'rating': 4.9,
      'experience': '16 years',
      'isOnline': true,
      'image': 'assets/doctor10.jpg',
    },
    {
      'name': 'Dr. Ava Thompson',
      'designation': 'Dermatologist',
      'department': 'Dermatology',
      'rating': 4.6,
      'experience': '8 years',
      'isOnline': false,
      'image': 'assets/doctor11.jpg',
    },
    {
      'name': 'Dr. Noah Garcia',
      'designation': 'Ophthalmologist',
      'department': 'Ophthalmology',
      'rating': 4.8,
      'experience': '12 years',
      'isOnline': true,
      'image': 'assets/doctor12.jpg',
    },
  ];

  List<Map<String, dynamic>> get filteredDoctors {
    if (_selectedSpecialty == 'All') {
      return _doctors;
    } else {
      return _doctors.where((doctor) => doctor['department'] == _selectedSpecialty).toList();
    }
  }

  int get onlineDoctorsCount {
    return _doctors.where((doctor) => doctor['isOnline']).length;
  }

  int get offlineDoctorsCount {
    return _doctors.where((doctor) => !doctor['isOnline']).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with blue waves
          CustomPaint(
            painter: MedicalWavePainter(),
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          ),
          
          // Mock status bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.black,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '11:20',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.white, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Main content
          Positioned.fill(
            top: 30, // Below the status bar
            child: Column(
              children: [
                // Back button
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Doctors List title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Our Doctors',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A3A6B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.medical_services,
                        color: const Color(0xFF1A3A6B),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 10),
                
                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Find the best specialists for your needs',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A90E2),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Online/Offline status summary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Online',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$onlineDoctorsCount Doctors',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A90E2),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Offline',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$offlineDoctorsCount Doctors',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3B5998),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Specialty filter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Filter by Specialty',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A3A6B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _specialties.length,
                          itemBuilder: (context, index) {
                            final specialty = _specialties[index];
                            final isSelected = specialty == _selectedSpecialty;
                            
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSpecialty = specialty;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xFF4A90E2) : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF4A90E2) : Colors.grey[300]!,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    specialty,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.grey[700],
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Doctors list
                Expanded(
                  child: filteredDoctors.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 60,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No doctors found',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Try changing your filter',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            final doctor = filteredDoctors[index];
                            return _buildDoctorCard(doctor);
                          },
                        ),
                ),
                
                // Footer
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  color: const Color(0xFF4A90E2),
                  child: Column(
                    children: const [
                      Text(
                        '© 2025 Health Calculator App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDoctorCard(Map<String, dynamic> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Doctor image
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: doctor['isOnline'] ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(width: 16),
            
            // Doctor info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctor['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A3A6B),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            doctor['rating'].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor['designation'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A90E2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          doctor['department'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4A90E2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        doctor['experience'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF4A90E2),
                            side: const BorderSide(color: Color(0xFF4A90E2)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                          child: const Text(
                            'Profile',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A90E2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                          child: const Text(
                            'Appointment',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for the medical-themed wave background
class MedicalWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the blue background
    final backgroundPaint = Paint()
      ..color = const Color(0xFF4A90E2)
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);
    
    // Draw the white wave
    final wavePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    final path = Path();
    
    // Start at the top right
    path.moveTo(size.width, 0);
    
    // Draw to the top left
    path.lineTo(0, 0);
    
    // Draw to the middle left
    path.lineTo(0, size.height * 0.4);
    
    // Create a curve from left to right
    path.quadraticBezierTo(
      size.width * 0.3, size.height * 0.35,
      size.width * 0.6, size.height * 0.55
    );
    
    // Create another curve to complete the wave
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.65,
      size.width, size.height * 0.6
    );
    
    // Close the path back to the top right
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, wavePaint);
    
    // Draw the white circle at the top
    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.1),
      size.width * 0.3,
      circlePaint
    );
    
    // Draw small medical cross symbols on the background
    final crossPaint = Paint()
      ..color = const Color(0xFFE3F2FD)
      ..style = PaintingStyle.fill;
    
    // Draw a few small crosses in the blue area
    _drawMedicalCross(canvas, Offset(size.width * 0.2, size.height * 0.2), 10, crossPaint);
    _drawMedicalCross(canvas, Offset(size.width * 0.5, size.height * 0.3), 8, crossPaint);
    _drawMedicalCross(canvas, Offset(size.width * 0.8, size.height * 0.4), 12, crossPaint);
    _drawMedicalCross(canvas, Offset(size.width * 0.3, size.height * 0.7), 10, crossPaint);
    _drawMedicalCross(canvas, Offset(size.width * 0.7, size.height * 0.8), 8, crossPaint);
  }
  
  void _drawMedicalCross(Canvas canvas, Offset center, double size, Paint paint) {
    // Horizontal line
    canvas.drawRect(
      Rect.fromCenter(
        center: center,
        width: size * 3,
        height: size,
      ),
      paint,
    );
    
    // Vertical line
    canvas.drawRect(
      Rect.fromCenter(
        center: center,
        width: size,
        height: size * 3,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}