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
      home: const MedicineListPage(),
    );
  }
}

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  
  final List<String> _categories = [
    'All',
    'Pain Relief',
    'Antibiotics',
    'Cardiovascular',
    'Respiratory',
    'Gastrointestinal',
    'Vitamins',
  ];

  final List<Map<String, dynamic>> _medicines = [
    {
      'name': 'Paracetamol',
      'description': 'Pain reliever and fever reducer',
      'dosage': '500mg',
      'category': 'Pain Relief',
      'price': 5.99,
      'inStock': true,
      'quantity': 120,
      'image': 'assets/medicine1.jpg',
    },
    {
      'name': 'Ibuprofen',
      'description': 'Anti-inflammatory pain reliever',
      'dosage': '400mg',
      'category': 'Pain Relief',
      'price': 7.49,
      'inStock': true,
      'quantity': 85,
      'image': 'assets/medicine2.jpg',
    },
    {
      'name': 'Amoxicillin',
      'description': 'Antibiotic for bacterial infections',
      'dosage': '250mg',
      'category': 'Antibiotics',
      'price': 12.99,
      'inStock': true,
      'quantity': 42,
      'image': 'assets/medicine3.jpg',
    },
    {
      'name': 'Lisinopril',
      'description': 'ACE inhibitor for high blood pressure',
      'dosage': '10mg',
      'category': 'Cardiovascular',
      'price': 15.50,
      'inStock': false,
      'quantity': 0,
      'image': 'assets/medicine4.jpg',
    },
    {
      'name': 'Atorvastatin',
      'description': 'Statin for cholesterol management',
      'dosage': '20mg',
      'category': 'Cardiovascular',
      'price': 18.75,
      'inStock': true,
      'quantity': 63,
      'image': 'assets/medicine5.jpg',
    },
    {
      'name': 'Salbutamol',
      'description': 'Bronchodilator for asthma',
      'dosage': '100mcg',
      'category': 'Respiratory',
      'price': 22.99,
      'inStock': true,
      'quantity': 28,
      'image': 'assets/medicine6.jpg',
    },
    {
      'name': 'Fluticasone',
      'description': 'Corticosteroid for allergies',
      'dosage': '50mcg',
      'category': 'Respiratory',
      'price': 24.50,
      'inStock': false,
      'quantity': 0,
      'image': 'assets/medicine7.jpg',
    },
    {
      'name': 'Omeprazole',
      'description': 'Proton pump inhibitor for acid reflux',
      'dosage': '20mg',
      'category': 'Gastrointestinal',
      'price': 14.25,
      'inStock': true,
      'quantity': 75,
      'image': 'assets/medicine8.jpg',
    },
    {
      'name': 'Loperamide',
      'description': 'Anti-diarrheal medication',
      'dosage': '2mg',
      'category': 'Gastrointestinal',
      'price': 8.99,
      'inStock': true,
      'quantity': 92,
      'image': 'assets/medicine9.jpg',
    },
    {
      'name': 'Vitamin D3',
      'description': 'Supplement for bone health',
      'dosage': '1000IU',
      'category': 'Vitamins',
      'price': 10.50,
      'inStock': true,
      'quantity': 150,
      'image': 'assets/medicine10.jpg',
    },
    {
      'name': 'Vitamin B Complex',
      'description': 'Energy and nervous system support',
      'dosage': '50mg',
      'category': 'Vitamins',
      'price': 12.75,
      'inStock': true,
      'quantity': 110,
      'image': 'assets/medicine11.jpg',
    },
    {
      'name': 'Metformin',
      'description': 'Oral diabetes medication',
      'dosage': '500mg',
      'category': 'Endocrine',
      'price': 9.99,
      'inStock': true,
      'quantity': 68,
      'image': 'assets/medicine12.jpg',
    },
    {
      'name': 'Levothyroxine',
      'description': 'Thyroid hormone replacement',
      'dosage': '50mcg',
      'category': 'Endocrine',
      'price': 11.25,
      'inStock': false,
      'quantity': 0,
      'image': 'assets/medicine13.jpg',
    },
    {
      'name': 'Cetirizine',
      'description': 'Antihistamine for allergies',
      'dosage': '10mg',
      'category': 'Allergy',
      'price': 8.50,
      'inStock': true,
      'quantity': 95,
      'image': 'assets/medicine14.jpg',
    },
    {
      'name': 'Aspirin',
      'description': 'Blood thinner and pain reliever',
      'dosage': '81mg',
      'category': 'Cardiovascular',
      'price': 6.99,
      'inStock': true,
      'quantity': 200,
      'image': 'assets/medicine15.jpg',
    },
    {
      'name': 'Ciprofloxacin',
      'description': 'Antibiotic for severe infections',
      'dosage': '500mg',
      'category': 'Antibiotics',
      'price': 19.99,
      'inStock': false,
      'quantity': 0,
      'image': 'assets/medicine16.jpg',
    },
    {
      'name': 'Loratadine',
      'description': 'Non-drowsy antihistamine',
      'dosage': '10mg',
      'category': 'Allergy',
      'price': 9.25,
      'inStock': true,
      'quantity': 82,
      'image': 'assets/medicine17.jpg',
    },
    {
      'name': 'Simvastatin',
      'description': 'Cholesterol-lowering medication',
      'dosage': '20mg',
      'category': 'Cardiovascular',
      'price': 16.50,
      'inStock': false,
      'quantity': 0,
      'image': 'assets/medicine18.jpg',
    },
  ];

  List<Map<String, dynamic>> get filteredMedicines {
    return _medicines.where((medicine) {
      // Apply category filter
      final categoryMatch = _selectedCategory == 'All' || medicine['category'] == _selectedCategory;
      
      // Apply search filter
      final searchMatch = _searchQuery.isEmpty || 
          medicine['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          medicine['description'].toLowerCase().contains(_searchQuery.toLowerCase());
      
      return categoryMatch && searchMatch;
    }).toList();
  }

  int get inStockCount {
    return _medicines.where((medicine) => medicine['inStock']).length;
  }

  int get outOfStockCount {
    return _medicines.where((medicine) => !medicine['inStock']).length;
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Medicine List title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Medicines',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A3A6B),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.medication,
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
                    'Browse our pharmacy inventory',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A90E2),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Stock status summary
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
                                  'In Stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$inStockCount Items',
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
                                  'Out of Stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$outOfStockCount Items',
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
                
                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search medicines...',
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF4A90E2)),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF4A90E2)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Category filter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Filter by Category',
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
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            final isSelected = category == _selectedCategory;
                            
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = category;
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
                                    category,
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
                
                // Medicines list
                Expanded(
                  child: filteredMedicines.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.medication_outlined,
                                size: 60,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No medicines found',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Try changing your search or filter',
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
                          itemCount: filteredMedicines.length,
                          itemBuilder: (context, index) {
                            final medicine = filteredMedicines[index];
                            return _buildMedicineCard(medicine);
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
  
  Widget _buildMedicineCard(Map<String, dynamic> medicine) {
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
            // Medicine image
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Center(
                child: Icon(
                  Icons.medication_outlined,
                  size: 40,
                  color: const Color(0xFF4A90E2).withOpacity(0.7),
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Medicine info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          medicine['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A3A6B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: medicine['inStock'] 
                              ? Colors.green.withOpacity(0.1) 
                              : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          medicine['inStock'] ? 'In Stock' : 'Out of Stock',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: medicine['inStock'] ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    medicine['description'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A90E2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          medicine['category'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4A90E2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.medical_information,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        medicine['dosage'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.inventory_2,
                            size: 16,
                            color: Color(0xFF1A3A6B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Qty: ${medicine['quantity']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A3A6B),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${medicine['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                    ],
                  ),
                  if (medicine['inStock'])
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
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
                                'Details',
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
                                'Add to Cart',
                                style: TextStyle(fontSize: 12),
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