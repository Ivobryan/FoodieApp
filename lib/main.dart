
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// TASK 2: StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodieApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// TASK 2 and TASK 4: HomeScreen using StatelessWidget,
// Scaffold, AppBar, Column and Row.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FoodieApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Welcome message
            const Text(
              'Welcome to FoodieApp!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Food heading
            const Text(
              'Choose Your Favorite Food',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // TASK 4 and TASK 5: Row, Expanded and Containers
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Pizza
                Expanded(
                  child: Container(
                    height: 230,
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Column(
                      children: [

                        // TASK 6: Pizza image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500',
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                height: 140,
                                child: Icon(
                                  Icons.local_pizza,
                                  size: 70,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Pizza',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                // Burger
                Expanded(
                  child: Container(
                    height: 230,
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Column(
                      children: [

                        // TASK 6: Burger image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                height: 140,
                                child: Icon(
                                  Icons.lunch_dining,
                                  size: 70,
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Burger',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),

            // TASK 3: StatefulWidget
            const FoodCounter(),

            const SizedBox(height: 25),

            // TASK 6: Order Now button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Your order has been received!',
                      ),
                    ),
                  );
                },

                child: const Text(
                  'Order Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// TASK 3: StatefulWidget for the shopping cart counter
class FoodCounter extends StatefulWidget {
  const FoodCounter({super.key});

  @override
  State<FoodCounter> createState() => _FoodCounterState();
}

class _FoodCounterState extends State<FoodCounter> {

  // Initialize counter to zero
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [

          const Text(
            'Items in Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Display current cart count
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),

          const SizedBox(height: 15),

          // Add to Cart button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 12,
              ),
            ),

            onPressed: () {
              setState(() {
                count++;
              });
            },

            icon: const Icon(Icons.shopping_cart),
            label: const Text('Add to Cart'),
          ),

        ],
      ),
    );
  }
}
