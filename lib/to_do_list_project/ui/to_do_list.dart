import 'package:flutter/material.dart';

import '../model/Task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<Task>? taskList = [
    Task(id: 1, title: 'Play', description: 'Task 1 Description', time: 30),
    Task(
        id: 2,
        title: 'Walk',
        description:
            'Task 2 Description dfdsf sdfs sfdsdfs fdsf s fsdfsfsdfsd ',
        time: 45),
    Task(id: 3, title: 'Movie', description: 'Task 3 Description', time: 60),
    Task(id: 4, title: 'Sleep', description: 'Task 4 Description', time: 20),
    Task(
        id: 5,
        title: 'Cook',
        description:
            'Task 5 Descriptiondgfg dfdsf sdfs sfdsdfs fdsf s fsdfsfsdfsd fsfsdfs',
        time: 15),
    Task(
        id: 5,
        title: 'Take a bath',
        description: 'Task 6 Description',
        time: 15),
    Task(id: 5, title: 'Cycling', description: 'Task 7 Description', time: 15),
    Task(
        id: 5,
        title: 'Go to library',
        description: 'Task 8 Description',
        time: 15),
    Task(
        id: 5,
        title: 'Help your mom',
        description: 'Task 9 Description',
        time: 15),
    Task(
        id: 5,
        title: 'Help needy people',
        description:
            'Task 10 Description dfdsf sdfs sfdsdfs fdsf s fsdfsfsdfsd',
        time: 15),
    Task(
        id: 5,
        title: 'Study maths',
        description: 'Task 11 Description',
        time: 15),
  ];
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
          title: const Text(
            'To Do List',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            ListView.builder(
                itemCount: taskList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                taskList![index].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Oswald'),
                              ),
                              Text(
                                taskList![index].description,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Oswald'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Positioned(
              bottom: 5,
              right: 5,
              child: FloatingActionButton(
                elevation: 2,
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  showInputDialog(context);
                },
                child: const Icon(Icons.add, color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showInputDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a new task', style: TextStyle(fontSize: 20, fontFamily: 'Oswald', color: Colors.black, fontWeight: FontWeight.w400),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('DONE', style: TextStyle(color: Colors.blueAccent),),
              onPressed: () {
                setState(() {
                  title = titleController.text;
                  description = descriptionController.text;
                });
                Navigator.of(context).pop();
                print('Title: $title, Description: $description');

              },
            ),
          ],
        );
      },
    );
  }
}
