import 'package:flutter/material.dart';

import '../ecommerce_app/nav_bar_screen.dart';
import 'details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true,),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const BottomNavBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(name: 'Ankit', email: 'ankit@gmail.com'),
      User(name: 'Saurabh', email: 'saurabh@gmail.com'),
      User(name: 'Pankaj', email: 'pankaj@gmail.com'),
      User(name: 'Shyam', email: 'shyam@gmail.com'),
      User(name: 'Harman', email: 'harman@gmail.com'),
      User(name: 'Sachin', email: 'sachin@gmail.com'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(

            //  show dialog on item click
/*              onTap: () {
                setState(() {
                  var selectedName = users[index].name;
                });

                // Show the selected name in a dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Selected Name'),
                    content: Text('You clicked on ${users[index].name}'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },*/

            //  show toast on item click
/*              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You clicked on ${users[index].name}'),
                    duration: const Duration(seconds: 2), // Adjust duration as needed
                  ),
                );
              },*/

          //  open new screen on item click
              onTap: () {
                // Navigate to details screen and pass the clicked name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(name: users[index].name),
                  ),
                );
              },
           child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.image, size: 60, color: Colors.black,),
                const SizedBox(width: 20), // Add horizontal space between the icons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users[index].name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                    Text(users[index].email, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ));
        }, itemCount: users.length,),
      )
      );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
