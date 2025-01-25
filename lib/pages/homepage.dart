import 'package:flutter/material.dart';

class GymFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Food Ordering',
      theme: ThemeData(primarySwatch: Colors.green),
      home: GymFoodHomePage(),
    );
  }
}

class GymFoodHomePage extends StatefulWidget {
  @override
  _GymFoodHomePageState createState() => _GymFoodHomePageState();
}

class _GymFoodHomePageState extends State<GymFoodHomePage> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Chicken Breast',
      'protein': 31,
      'calories': 165,
      'image': 'assets/food.png'
    },
    {
      'name': 'Eggs',
      'protein': 13,
      'calories': 155,
      'image': 'assets/food.png'
    },
    {
      'name': 'Greek Yogurt',
      'protein': 10,
      'calories': 59,
      'image': 'assets/food.png'
    },
    {
      'name': 'Protein Shake',
      'protein': 25,
      'calories': 120,
      'image': 'assets/food.png'
    },
  ];

  List<Map<String, dynamic>> cart = [];
  int _selectedIndex = 0;

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      cart.add(product);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
        List<Widget> pages = [
      // Home Page
      ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(product['image']),
                    title: Text(product['name']),
                    subtitle: Text('Protein: ${product['protein']}g, Calories: ${product['calories']} kcal'),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(product),
                      child: Text('Add'),
                    ),
                  ),
                );
              },
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return Card(
                        child: ListTile(
                          leading: Image.asset(product['image']),
                          title: Text(product['name']),
                          subtitle: Text(
                              'Protein: ${product['protein']}g, Calories: ${product['calories']} kcal'),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total Protein: ${cart.fold<int>(0, (sum, item) => sum + item['protein'] as int)}g',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total Calories: ${cart.fold<int>(0, (sum, item) => sum + item['calories'] as int)} kcal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym Food Ordering'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
