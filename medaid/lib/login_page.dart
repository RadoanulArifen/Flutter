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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                          // Handle back button press
                        },
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Login text with medical icon
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A3A6B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.medical_services_outlined,
                        color: const Color(0xFF1A3A6B),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 10),
                
                // Subtitle for medical app
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your health, our priority',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4A90E2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Email/Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'E-Mail/Username',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(Icons.email, color: Colors.purple[200], size: 20),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Stack(
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.purple[200], size: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 224, 227, 232),
                      foregroundColor:Color(0xFF1A3A6B),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                const Spacer(),
                
                // Social login section with bottom elements
                SizedBox(
                  height: 200, // Fixed height for the bottom section
                  child: Stack(
                    children: [
                      // Blue circle for social login
                      Positioned(
                        bottom: 70,
                        left: -40,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3B5998),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      
                      // Light blue overlay
                      Positioned(
                        bottom: 70,
                        left: 60,
                        child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A90E2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 70, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Login with Social Media',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Social media icons
                      Positioned(
                        bottom: 100,
                        right: 40,
                        child: Row(
                          children: [
                            // Gmail icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.mail,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            
                            // Facebook icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.facebook,
                                color: const Color(0xFF3B5998),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            
                            // Instagram icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: CustomPaint(
                                size: const Size(18, 18),
                                painter: InstagramLogoPainter(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // New user section
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 20, top: 10),
                          color: const Color(0xFF4A90E2),
                          child: Column(
                            children: [
                              const Text(
                                'New User?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle create new account
                                },
                                child: const Text(
                                  'Create New Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
}

// Custom Instagram logo painter
class InstagramLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..shader = LinearGradient(
        colors: [
          Colors.purple,
          Colors.pink,
          Colors.orange,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // Draw outer rounded rectangle
    final RRect outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.width * 0.3),
    );
    canvas.drawRRect(outerRect, paint);
    
    // Draw inner circle
    final Paint circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..shader = LinearGradient(
        colors: [
          Colors.purple,
          Colors.pink,
          Colors.orange,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.25,
      circlePaint,
    );
    
    // Draw top-right dot
    final Paint dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.pink;
    
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.25),
      size.width * 0.08,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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