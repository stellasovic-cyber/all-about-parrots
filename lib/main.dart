import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All About Parrots',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          backgroundColor: Color(0xFF2E7D32),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final List<Map<String, String>> parrots = [];

  @override
  void dispose() {
    nameController.dispose();
    speciesController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _addParrot() {
    if (nameController.text.isEmpty ||
        speciesController.text.isEmpty ||
        ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      parrots.add({
        'name': nameController.text,
        'species': speciesController.text,
        'age': ageController.text,
      });
    });

    nameController.clear();
    speciesController.clear();
    ageController.clear();

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Parrot added successfully!')),
    );
  }

  void _showAddParrotDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Your Parrot'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Parrot Name'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: speciesController,
                decoration: const InputDecoration(labelText: 'Species'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age (years)'),
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
            onPressed: _addParrot,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All About Parrots'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        '🦜 Welcome to Parrot Care Guide',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your complete guide to parrot care, nutrition, behavior, and safety.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      if (parrots.isNotEmpty)
                        Text(
                          'Parrots: ${parrots.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              if (parrots.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Parrots',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...parrots.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, String> parrot = entry.value;
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.pets),
                          title: Text(parrot['name'] ?? ''),
                          subtitle: Text(
                            '${parrot['species'] ?? ''} • ${parrot['age'] ?? ''} years',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                parrots.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                  ],
                ),

              const Text(
                'Care Guide Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryButton(
                context,
                icon: '🥗',
                title: 'Nutrition',
                description: 'Healthy foods & diet plans',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NutritionScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryButton(
                context,
                icon: '🧠',
                title: 'Behavior',
                description: 'Understand your parrot',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BehaviorScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryButton(
                context,
                icon: '☠️',
                title: 'Toxic Foods',
                description: 'Foods to avoid',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToxicFoodsScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryButton(
                context,
                icon: '🏡',
                title: 'Home Environment',
                description: 'Safe living conditions',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnvironmentScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryButton(
                context,
                icon: '🎮',
                title: 'Toys & Cages',
                description: 'Enrichment & housing',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToysCagesScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddParrotDialog,
        tooltip: 'Add a parrot',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context, {
    required String icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nutritionList = [
      {'name': 'Pellets', 'desc': 'High-quality bird pellets (60-70% of diet)', 'benefits': 'Complete nutrition, balanced vitamins and minerals'},
      {'name': 'Fresh Fruits', 'desc': 'Apples, berries, oranges, mangoes (10-15%)', 'benefits': 'Vitamins, antioxidants, hydration'},
      {'name': 'Vegetables', 'desc': 'Leafy greens, carrots, broccoli (15-20%)', 'benefits': 'Fiber, vitamins, minerals'},
      {'name': 'Nuts & Seeds', 'desc': 'Almonds, walnuts, sunflower seeds (5-10%)', 'benefits': 'Protein, healthy fats, enrichment'},
      {'name': 'Proteins', 'desc': 'Cooked eggs, legumes, lean meats (occasional)', 'benefits': 'Amino acids, muscle development'},
      {'name': 'Water', 'desc': 'Fresh, clean water changed daily', 'benefits': 'Hydration, essential for all bodily functions'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Guide'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: nutritionList.length,
        itemBuilder: (context, index) {
          final item = nutritionList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                item['name'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(item['desc'] ?? ''),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Benefits:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Text(item['benefits'] ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BehaviorScreen extends StatelessWidget {
  const BehaviorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final behaviorList = [
      {'behavior': 'Head Bobbing', 'meaning': 'Excitement or interest', 'response': 'Engage and play with them'},
      {'behavior': 'Feather Ruffling', 'meaning': 'Relaxation or comfort', 'response': 'They are happy and content'},
      {'behavior': 'Eye Pinning', 'meaning': 'Alert or excited', 'response': 'They are focused on something'},
      {'behavior': 'Screaming', 'meaning': 'Communication or distress', 'response': 'Check if they need attention or have a problem'},
      {'behavior': 'Beak Grinding', 'meaning': 'Contentment and sleep', 'response': 'They feel safe and relaxed'},
      {'behavior': 'Wing Flapping', 'meaning': 'Exercise or excitement', 'response': 'Great way for them to stay active'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parrot Behavior'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: behaviorList.length,
        itemBuilder: (context, index) {
          final item = behaviorList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                item['behavior'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(item['meaning'] ?? ''),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('How to Respond:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(item['response'] ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ToxicFoodsScreen extends StatelessWidget {
  const ToxicFoodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toxicFoods = [
      {'food': 'Avocado', 'reason': 'Contains persin, a fungal toxin', 'severity': 'High'},
      {'food': 'Chocolate', 'reason': 'Contains theobromine and caffeine', 'severity': 'High'},
      {'food': 'Salt & Caffeine', 'reason': 'Harmful to nervous system', 'severity': 'High'},
      {'food': 'Onions & Garlic', 'reason': 'Damages red blood cells', 'severity': 'Medium'},
      {'food': 'Fatty Foods', 'reason': 'Causes obesity and health issues', 'severity': 'Medium'},
      {'food': 'Pesticides', 'reason': 'Harmful chemicals', 'severity': 'High'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toxic Foods'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: toxicFoods.length,
        itemBuilder: (context, index) {
          final item = toxicFoods[index];
          final severity = item['severity'] ?? 'Medium';
          final color = severity == 'High' ? Colors.red : severity == 'Medium' ? Colors.orange : Colors.yellow;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                item['food'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: Chip(
                label: Text(severity),
                backgroundColor: color,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Why it\'s toxic:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(item['reason'] ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EnvironmentScreen extends StatelessWidget {
  const EnvironmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final envItems = [
      {'feature': 'Temperature', 'requirement': '65-80°F (18-27°C)', 'importance': 'Critical'},
      {'feature': 'Humidity', 'requirement': '40-60% humidity level', 'importance': 'High'},
      {'feature': 'Light', 'requirement': '10-12 hours of sunlight daily', 'importance': 'High'},
      {'feature': 'Ventilation', 'requirement': 'Fresh air circulation, avoid fumes', 'importance': 'High'},
      {'feature': 'Space', 'requirement': 'Room to fly and exercise', 'importance': 'Critical'},
      {'feature': 'Safety', 'requirement': 'Remove toxic plants and hazards', 'importance': 'Critical'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Environment'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: envItems.length,
        itemBuilder: (context, index) {
          final item = envItems[index];
          final importance = item['importance'] ?? 'Medium';
          final color = importance == 'Critical' ? Colors.red : Colors.blue;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                item['feature'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(item['requirement'] ?? ''),
              trailing: Chip(
                label: Text(importance),
                backgroundColor: color,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Requirements:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(item['requirement'] ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ToysCagesScreen extends StatelessWidget {
  const ToysCagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toys & Cages'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'Toys for Enrichment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _toyCard('Chew Toys', 'Wooden or natural materials', 'Satisfies natural chewing behavior'),
              _toyCard('Swings', 'Hanging perches and swings', 'Exercise and play'),
              _toyCard('Bells', 'Bell toys with different sounds', 'Mental stimulation and sound enrichment'),
              _toyCard('Foraging Toys', 'Toys that hide treats', 'Mimics natural foraging behavior'),
              _toyCard('Mirrors', 'Safe bird mirrors', 'Visual enrichment (limit use)'),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'Cage Sizes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _cageCard('Small (Budgies)', 'Minimum 18x18x24 inches', 'Perches, toys, water/food bowls'),
              _cageCard('Medium (Cockatiels)', 'Minimum 24x24x36 inches', 'Multiple perches, toys, ventilation'),
              _cageCard('Large (Macaws)', 'Minimum 36x48x48 inches or larger', 'Multiple perches, toys, space to fly'),
              _cageCard('Extra Large (Multiple birds)', '48+ inches, multiple compartments', 'Separated areas, multiple feeding stations'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toyCard(String name, String desc, String benefits) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Benefits: $benefits',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cageCard(String size, String desc, String req) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              size,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Requirements: $req',
              style: const TextStyle(fontSize: 12),
            ),
          ],
