import 'package:flutter/material.dart';
import 'package:flutter_demo/services/remote_services.dart';

import '../model/Post.dart';
import 'details_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  List<Post>? posts;
  var isLoaded = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch data from API
    getData();
  }

  Future<void> getData() async {
    posts = await RemoteServices().getPosts(); // Replace with your actual API call
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getWidgetForIndex(int index) {
    switch (index) {
      case 0:
        return buildHomeScreen();
      case 1:
        // return SearchScreen();
      case 2:
        return buildPostsScreen();
      case 3:
        // return ProfileScreen();
      default:
        return buildHomeScreen();
    }
  }

  Widget buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(name: posts![index].title),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/man.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts![index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posts?[index].body ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                _onDrawerItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                _onDrawerItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text('Posts'),
              onTap: () {
                _onDrawerItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                _onDrawerItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostsScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const Center(
        child: Text('Posts Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                _onDrawerItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                _onDrawerItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text('Posts'),
              onTap: () {
                _onDrawerItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                _onDrawerItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getWidgetForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                _onDrawerItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                _onDrawerItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text('Posts'),
              onTap: () {
                _onDrawerItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                _onDrawerItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}