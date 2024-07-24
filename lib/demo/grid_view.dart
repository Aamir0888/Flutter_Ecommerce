import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
          children: List.generate(users.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(name: users[index].name),
                  ),
                );
              },
              child: Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.image, size: 60, color: Colors.black),
                      const SizedBox(height: 10), // Add vertical space between icon and text
                      Text(
                        users[index].name,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8), // Add vertical space between name and email
                      Flexible(
                        child: Text(
                          users[index].email,
                          maxLines: 2, // Limit to 2 lines for better visibility
                          overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String name;

  const DetailsScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text(
          'Clicked Name: $name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

// Sample list of users
final List<User> users = [
  User(name: 'Ankit', email: 'ankit@gmail.com'),
  User(name: 'Saurabh', email: 'saurabh@gmail.com'),
  User(name: 'Pankaj', email: 'pankaj@gmail.com'),
  User(name: 'Shyam', email: 'shyam@gmail.com'),
  User(name: 'Harman', email: 'harman@gmail.com'),
  User(name: 'Sachin', email: 'sachin@gmail.com'),
];
