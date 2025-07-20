import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blessing Pharma and Medical Supplies',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Blessing Pharma',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnlinePharmacy(),
                      ),
                    );
                  },
                  child: const Text('LOGIN', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnlinePharmacy extends StatefulWidget {
  const OnlinePharmacy({super.key});

  @override
  State<OnlinePharmacy> createState() => _OnlinePharmacyState();
}

class _OnlinePharmacyState extends State<OnlinePharmacy> {
  int _cartItemCount = 0;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _cartItems = [];
  final List<Map<String, dynamic>> _inventoryItems = [];

  final List<Map<String, dynamic>> _products = [
    {
      'category': 'Covid Essentials',
      'items': [
        {
          'name': 'N95 Mask (10 pcs)',
          'price': 299.00,
          'image': 'assets/mask.png',
        },
        {
          'name': 'Hand Sanitizer (500ml)',
          'price': 149.00,
          'image': 'assets/sanitizer.png',
        },
        {'name': 'Face Shield', 'price': 99.00, 'image': 'assets/shield.png'},
        {
          'name': 'Disposable Gloves (100 pcs)',
          'price': 249.00,
          'image': 'assets/gloves.png',
        },
        {
          'name': 'Thermometer',
          'price': 399.00,
          'image': 'assets/thermometer.png',
        },
      ],
    },
    {
      'category': 'Vitamins & Supplements',
      'items': [
        {
          'name': 'Vitamin C 1000mg',
          'price': 249.00,
          'image': 'assets/vitamin_c.png',
        },
        {
          'name': 'Multivitamin Complex',
          'price': 349.00,
          'image': 'assets/multivitamin.png',
        },
        {
          'name': 'Vitamin D3 5000IU',
          'price': 299.00,
          'image': 'assets/vitamin_d.png',
        },
        {
          'name': 'Omega-3 Fish Oil',
          'price': 449.00,
          'image': 'assets/fish_oil.png',
        },
        {
          'name': 'Calcium + Magnesium',
          'price': 329.00,
          'image': 'assets/calcium.png',
        },
      ],
    },
    {
      'category': 'Pain Relief',
      'items': [
        {
          'name': 'Ibuprofen 200mg',
          'price': 149.00,
          'image': 'assets/ibuprofen.png',
        },
        {
          'name': 'Acetaminophen 500mg',
          'price': 99.00,
          'image': 'assets/acetaminophen.png',
        },
        {'name': 'Aspirin 81mg', 'price': 89.00, 'image': 'assets/aspirin.png'},
        {
          'name': 'Naproxen Sodium',
          'price': 199.00,
          'image': 'assets/naproxen.png',
        },
        {
          'name': 'Migraine Relief',
          'price': 249.00,
          'image': 'assets/migraine.png',
        },
      ],
    },
    {
      'category': 'Digestive Health',
      'items': [
        {
          'name': 'Antacid Tablets',
          'price': 129.00,
          'image': 'assets/antacid.png',
        },
        {
          'name': 'Probiotic Supplement',
          'price': 499.00,
          'image': 'assets/probiotic.png',
        },
        {'name': 'Laxative', 'price': 169.00, 'image': 'assets/laxative.png'},
        {
          'name': 'Anti-Diarrheal',
          'price': 149.00,
          'image': 'assets/antidiarrheal.png',
        },
        {
          'name': 'Digestive Enzymes',
          'price': 399.00,
          'image': 'assets/enzymes.png',
        },
      ],
    },
    {
      'category': 'Skin Care',
      'items': [
        {
          'name': 'Antibiotic Ointment',
          'price': 119.00,
          'image': 'assets/ointment.png',
        },
        {
          'name': 'Hydrocortisone Cream',
          'price': 149.00,
          'image': 'assets/hydrocortisone.png',
        },
        {
          'name': 'Antifungal Cream',
          'price': 179.00,
          'image': 'assets/antifungal.png',
        },
        {'name': 'Acne Treatment', 'price': 229.00, 'image': 'assets/acne.png'},
        {
          'name': 'Moisturizing Lotion',
          'price': 199.00,
          'image': 'assets/lotion.png',
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> _dashboardItems = [
    {
      'title': 'Total Orders',
      'value': '24',
      'icon': Icons.shopping_bag,
      'color': Colors.blue,
    },
    {
      'title': 'Pending Orders',
      'value': '5',
      'icon': Icons.pending_actions,
      'color': Colors.orange,
    },
    {
      'title': 'Completed Orders',
      'value': '19',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'title': 'Total Revenue',
      'value': '₱24,245',
      'icon': Icons.attach_money,
      'color': Colors.purple,
    },
    {
      'title': 'New Customers',
      'value': '8',
      'icon': Icons.person_add,
      'color': Colors.teal,
    },
    {
      'title': 'Returning Customers',
      'value': '16',
      'icon': Icons.people,
      'color': Colors.indigo,
    },
  ];

  final List<Map<String, dynamic>> _salesData = [
    {'day': 'Mon', 'sales': 1200},
    {'day': 'Tue', 'sales': 2000},
    {'day': 'Wed', 'sales': 1500},
    {'day': 'Thu', 'sales': 1800},
    {'day': 'Fri', 'sales': 2200},
    {'day': 'Sat', 'sales': 2500},
    {'day': 'Sun', 'sales': 1900},
  ];

  final List<Map<String, dynamic>> _topProducts = [
    {'name': 'N95 Mask', 'sales': 45, 'image': 'assets/mask.png'},
    {'name': 'Vitamin C', 'sales': 38, 'image': 'assets/vitamin_c.png'},
    {'name': 'Gloves', 'sales': 32, 'image': 'assets/gloves.png'},
    {'name': 'Ibuprofen', 'sales': 28, 'image': 'assets/ibuprofen.png'},
    {'name': 'Probiotic', 'sales': 25, 'image': 'assets/probiotic.png'},
  ];

  final List<Map<String, dynamic>> _orderHistory = [
    {
      'orderId': 'ORD-1001',
      'date': 'May 15, 2023',
      'status': 'Completed',
      'amount': 859.00,
      'items': [
        {'name': 'N95 Mask (10 pcs)', 'qty': 2, 'price': 299.00},
        {'name': 'Hand Sanitizer', 'qty': 1, 'price': 149.00},
      ],
    },
    {
      'orderId': 'ORD-1002',
      'date': 'May 10, 2023',
      'status': 'Completed',
      'amount': 547.00,
      'items': [
        {'name': 'Vitamin C 1000mg', 'qty': 1, 'price': 249.00},
        {'name': 'Aspirin 81mg', 'qty': 2, 'price': 89.00},
      ],
    },
    {
      'orderId': 'ORD-1003',
      'date': 'May 5, 2023',
      'status': 'Completed',
      'amount': 1297.00,
      'items': [
        {'name': 'Omega-3 Fish Oil', 'qty': 1, 'price': 449.00},
        {'name': 'Multivitamin Complex', 'qty': 1, 'price': 349.00},
        {'name': 'Thermometer', 'qty': 1, 'price': 399.00},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _updateCartCount();

    _inventoryItems.addAll([
      {
        'name': 'N95 Mask',
        'stock': 45,
        'threshold': 20,
        'price': 299.00,
        'category': 'Covid Essentials',
      },
      {
        'name': 'Paracetamol',
        'stock': 32,
        'threshold': 15,
        'price': 99.00,
        'category': 'Pain Relief',
      },
      {
        'name': 'Vitamin C',
        'stock': 28,
        'threshold': 10,
        'price': 249.00,
        'category': 'Vitamins & Supplements',
      },
      {
        'name': 'Hand Sanitizer',
        'stock': 38,
        'threshold': 15,
        'price': 149.00,
        'category': 'Covid Essentials',
      },
      {
        'name': 'Ibuprofen',
        'stock': 52,
        'threshold': 20,
        'price': 149.00,
        'category': 'Pain Relief',
      },
      {
        'name': 'Omega-3 Fish Oil',
        'stock': 18,
        'threshold': 10,
        'price': 449.00,
        'category': 'Vitamins & Supplements',
      },
      {
        'name': 'Probiotic',
        'stock': 22,
        'threshold': 15,
        'price': 499.00,
        'category': 'Digestive Health',
      },
      {
        'name': 'Antacid',
        'stock': 30,
        'threshold': 20,
        'price': 129.00,
        'category': 'Digestive Health',
      },
    ]);
  }

  void _updateCartCount() {
    _cartItemCount = _cartItems.fold(
      0,
      (sum, item) => sum + (item['quantity'] as int),
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  void _addToCart(String name, String image, double price) {
    final existingIndex = _cartItems.indexWhere((item) => item['name'] == name);
    setState(() {
      if (existingIndex >= 0) {
        _cartItems[existingIndex]['quantity'] += 1;
      } else {
        _cartItems.add({
          'name': name,
          'price': price,
          'quantity': 1,
          'image': image,
        });
      }
      _updateCartCount();
    });
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$name added to cart')));
    }
  }

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            final total = _cartItems.fold<double>(
              0,
              (sum, item) => sum + (item['price'] * item['quantity']),
            );
            return AlertDialog(
              title: const Text('Your Cart'),
              content: SizedBox(
                width: double.maxFinite,
                child: _cartItems.isEmpty
                    ? const Text("Cart is empty.")
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              leading: Image.asset(
                                item['image'],
                                width: 40,
                                height: 40,
                              ),
                              title: Text(item['name']),
                              subtitle: Text(
                                '₱${item['price'].toStringAsFixed(2)}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (item['quantity'] > 1) {
                                          item['quantity']--;
                                        } else {
                                          _cartItems.removeAt(index);
                                        }
                                        _updateCartCount();
                                      });
                                      setStateDialog(() {});
                                    },
                                  ),
                                  Text('${item['quantity']}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        item['quantity']++;
                                        _updateCartCount();
                                      });
                                      setStateDialog(() {});
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _cartItems.removeAt(index);
                                        _updateCartCount();
                                      });
                                      Navigator.pop(dialogContext);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              actions: [
                Text(
                  'Total: ₱${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text('Continue Shopping'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        if (_cartItems.isNotEmpty && mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed successfully!'),
                            ),
                          );
                          setState(() {
                            _cartItems.clear();
                            _updateCartCount();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showOrderHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Order History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _orderHistory.length,
                  itemBuilder: (context, index) {
                    final order = _orderHistory[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ExpansionTile(
                        title: Text('Order #${order['orderId']}'),
                        subtitle: Text(
                          '${order['date']} - ₱${order['amount']}',
                          style: TextStyle(
                            color: order['status'] == 'Completed'
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        children: [
                          ...order['items'].map<Widget>((item) {
                            return ListTile(
                              title: Text(item['name']),
                              subtitle: Text('Qty: ${item['qty']}'),
                              trailing: Text('₱${item['price']}'),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status: ${order['status']}',
                                  style: TextStyle(
                                    color: order['status'] == 'Completed'
                                        ? Colors.green
                                        : Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Total: ₱${order['amount']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Notification Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: const Text('Order Updates'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Promotions'),
                value: false,
                onChanged: (value) {},
              ),
              const Divider(),
              const Text(
                'Account Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Change Password'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password change requested')),
                  );
                },
              ),
              ListTile(
                title: const Text('Update Email'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email update requested')),
                  );
                },
              ),
              const Divider(),
              const Text(
                'App Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: false,
                onChanged: (value) {},
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close Settings'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHelpAndSupport(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Help & Support',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildFAQItem(
                      'How do I place an order?',
                      'Browse products, add to cart, and proceed to checkout. You can pay via various payment methods.',
                    ),
                    _buildFAQItem(
                      'What is your return policy?',
                      'You can return unused, unopened items within 30 days of purchase with original receipt.',
                    ),
                    _buildFAQItem(
                      'How long does delivery take?',
                      'Standard delivery takes 3-5 business days. Express delivery available for select areas.',
                    ),
                    _buildFAQItem(
                      'Do you accept prescriptions?',
                      'Yes, you can upload your prescription during checkout or contact our support team.',
                    ),
                    _buildFAQItem(
                      'How do I track my order?',
                      'You will receive a tracking number via email once your order is shipped.',
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email Us'),
                subtitle: const Text('support@blessingpharma.com'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Call Us'),
                subtitle: const Text('09954295432'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('Live Chat'),
                subtitle: const Text('Available 9AM-5PM, Mon-Fri'),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(padding: const EdgeInsets.all(16.0), child: Text(answer)),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchBar(),
          _buildCarouselSection(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shop by Category',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      _pageController.jumpToPage(1);
                    });
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> sampleItems = [
                {
                  'name': 'N95 Mask',
                  'image': 'assets/mask.png',
                  'price': 299.00,
                },
                {
                  'name': 'Acne Cream',
                  'image': 'assets/acne.png',
                  'price': 229.00,
                },
                {
                  'name': 'Antacid',
                  'image': 'assets/antacid.png',
                  'price': 129.00,
                },
                {
                  'name': 'Aspirin',
                  'image': 'assets/aspirin.png',
                  'price': 89.00,
                },
                {
                  'name': 'Calcium',
                  'image': 'assets/calcium.png',
                  'price': 329.00,
                },
                {
                  'name': 'Enzymes',
                  'image': 'assets/enzymes.png',
                  'price': 399.00,
                },
                {
                  'name': 'Lotion',
                  'image': 'assets/lotion.png',
                  'price': 199.00,
                },
                {
                  'name': 'Sanitizer',
                  'image': 'assets/sanitizer.png',
                  'price': 149.00,
                },
                {
                  'name': 'Vitamin C',
                  'image': 'assets/vitamin_c.png',
                  'price': 249.00,
                },
                {
                  'name': 'Multivitamin',
                  'image': 'assets/multivitamin.png',
                  'price': 349.00,
                },
                {
                  'name': 'Pain Relief',
                  'image': 'assets/ibuprofen.png',
                  'price': 149.00,
                },
                {
                  'name': 'Antacid',
                  'image': 'assets/antacid.png',
                  'price': 129.00,
                },
              ];

              final item = sampleItems[index];
              return _buildCategoryCard(
                item['name'],
                item['image'],
                item['price'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductsScreen() {
    List<Map<String, dynamic>> filteredProducts = [];

    if (_searchQuery.isEmpty) {
      filteredProducts = List.from(_products);
    } else {
      for (var category in _products) {
        var filteredItems = category['items']
            .where(
              (item) => item['name'].toString().toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ),
            )
            .toList();

        if (filteredItems.isNotEmpty) {
          filteredProducts.add({
            'category': category['category'],
            'items': filteredItems,
          });
        }
      }
    }

    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final category = filteredProducts[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                child: ExpansionTile(
                  title: Text(
                    category['category'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ...category['items'].map<Widget>((item) {
                      return ListTile(
                        leading: Image.asset(
                          item['image'],
                          width: 50,
                          height: 50,
                        ),
                        title: Text(item['name']),
                        subtitle: Text('₱${item['price'].toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                final existingIndex = _cartItems.indexWhere(
                                  (cartItem) =>
                                      cartItem['name'] == item['name'],
                                );
                                if (existingIndex >= 0 &&
                                    _cartItems[existingIndex]['quantity'] > 0) {
                                  setState(() {
                                    _cartItems[existingIndex]['quantity'] -= 1;
                                    if (_cartItems[existingIndex]['quantity'] ==
                                        0) {
                                      _cartItems.removeAt(existingIndex);
                                    }
                                    _updateCartCount();
                                  });
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.green,
                              ),
                              onPressed: () => _addToCart(
                                item['name'],
                                item['image'],
                                item['price'],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAccountScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Kurth Pogi Manalo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'kurthjhoemarkm@gmail.com',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.history, color: Colors.blue),
                  title: const Text('Order History'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showOrderHistory(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.grey),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showSettings(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.orange),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showHelpAndSupport(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('App Version 1.0.0', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildDashboardScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: _showAddInventoryItemDialog,
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Sales Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _salesData.length,
              itemBuilder: (context, index) {
                final data = _salesData[index];
                final maxSales = _salesData.fold<double>(
                  0,
                  (max, item) =>
                      item['sales'] > max ? item['sales'].toDouble() : max,
                );
                final barHeight = (data['sales'] / maxSales) * 150;
                return Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '₱${data['sales']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: barHeight > 0 ? barHeight : 1,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['day'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Inventory Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product Inventory',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total: ${_inventoryItems.length} items',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ..._inventoryItems.map((item) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(item['name']),
                          subtitle: Text(item['category']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${item['stock']}',
                                style: TextStyle(
                                  color: item['stock'] < item['threshold']
                                      ? Colors.red
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(' in stock'),
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20),
                                onPressed: () =>
                                    _showEditInventoryItemDialog(item),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Top Selling Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _topProducts.length,
              itemBuilder: (context, index) {
                final product = _topProducts[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(product['image'], height: 40, width: 40),
                          const SizedBox(height: 5),
                          Text(
                            product['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${product['sales']} sold',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children: [
              ..._dashboardItems.map((item) {
                return Card(
                  elevation: 3,
                  color: Color.lerp(item['color'], Colors.white, 0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 30, color: item['color']),
                        const SizedBox(height: 8),
                        Text(
                          item['title'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['value'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: item['color'],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Recent Orders',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildRecentOrderItem('ORD-001', 'Completed', '₱859.00'),
                  const Divider(),
                  _buildRecentOrderItem('ORD-002', 'Processing', '₱547.00'),
                  const Divider(),
                  _buildRecentOrderItem('ORD-003', 'Completed', '₱1,297.00'),
                  const Divider(),
                  _buildRecentOrderItem('ORD-004', 'Shipped', '₱499.00'),
                  const Divider(),
                  _buildRecentOrderItem('ORD-005', 'Pending', '₱349.00'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
                _pageController.jumpToPage(1);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'View All Products',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddInventoryItemDialog() {
    final nameController = TextEditingController();
    final categoryController = TextEditingController();
    final stockController = TextEditingController();
    final thresholdController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Inventory Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: stockController,
                  decoration: const InputDecoration(
                    labelText: 'Current Stock',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: thresholdController,
                  decoration: const InputDecoration(
                    labelText: 'Low Stock Threshold',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    categoryController.text.isNotEmpty &&
                    stockController.text.isNotEmpty &&
                    thresholdController.text.isNotEmpty &&
                    priceController.text.isNotEmpty) {
                  setState(() {
                    _inventoryItems.add({
                      'name': nameController.text,
                      'category': categoryController.text,
                      'stock': int.parse(stockController.text),
                      'threshold': int.parse(thresholdController.text),
                      'price': double.parse(priceController.text),
                    });
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showEditInventoryItemDialog(Map<String, dynamic> item) {
    final nameController = TextEditingController(text: item['name']);
    final categoryController = TextEditingController(text: item['category']);
    final stockController = TextEditingController(
      text: item['stock'].toString(),
    );
    final thresholdController = TextEditingController(
      text: item['threshold'].toString(),
    );
    final priceController = TextEditingController(
      text: item['price'].toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Inventory Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: stockController,
                  decoration: const InputDecoration(
                    labelText: 'Current Stock',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: thresholdController,
                  decoration: const InputDecoration(
                    labelText: 'Low Stock Threshold',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    categoryController.text.isNotEmpty &&
                    stockController.text.isNotEmpty &&
                    thresholdController.text.isNotEmpty &&
                    priceController.text.isNotEmpty) {
                  setState(() {
                    final index = _inventoryItems.indexWhere(
                      (i) => i['name'] == item['name'],
                    );
                    if (index != -1) {
                      _inventoryItems[index] = {
                        'name': nameController.text,
                        'category': categoryController.text,
                        'stock': int.parse(stockController.text),
                        'threshold': int.parse(thresholdController.text),
                        'price': double.parse(priceController.text),
                      };
                    }
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  _inventoryItems.removeWhere((i) => i['name'] == item['name']);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecentOrderItem(String orderId, String status, String amount) {
    Color statusColor = Colors.grey;
    if (status == 'Completed') {
      statusColor = Colors.green;
    } else if (status == 'Processing') {
      statusColor = Colors.blue;
    } else if (status == 'Shipped') {
      statusColor = Colors.orange;
    } else if (status == 'Pending') {
      statusColor = Colors.red;
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.shopping_bag, color: Colors.green),
      ),
      title: Text(orderId, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(status, style: TextStyle(color: statusColor)),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search medicines and supplies...',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
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
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg3.jpg'),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CarouselSlider(
              items: ['assets/imgdoc.png', 'assets/imgdoc1.png'].map((img) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 120.0,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 0.8,
              ),
            ),
          ),
          const Text(
            'Upload Your Prescription',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please upload your med supply and prescription\nso we can assist your purchase',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.greenAccent),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            child: const Text(
              'Upload Medical and Prescription',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String name, String imagePath, double price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _addToCart(name, imagePath, price),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 60, width: 60),
              const SizedBox(height: 10),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '₱${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Blessing Pharma and Medical Supplies',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: _showCheckoutDialog,
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text('Dashboard')),
                  body: _buildDashboardScreen(),
                ),
              ),
            ),
            icon: const Icon(Icons.dashboard, color: Colors.black),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: [
          _buildHomeScreen(),
          _buildProductsScreen(),
          _buildAccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Products',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
