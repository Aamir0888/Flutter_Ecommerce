import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;

  const DetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Text(
          'Clicked Name: $name',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
