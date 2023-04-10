// imports the necessary Flutter libraries
import 'package:flutter/material.dart';

// import two custom tools into the application
import 'tool_calculator.dart';
import 'tool_notes.dart';

// The main() function is the entry point of the application and runs the app
void main() {
  //runs myApp widget
  runApp(const MyApp());
}

// MyApp widget that represents the entire application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // build() method returns a MaterialApp widget that contains the application's routes and theme
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title of app
      title: 'Flutter Demo',

      // theme of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // initial route of app (home)
      initialRoute: '/',

      // routes of app - home, calculator, notes
      routes: {
        '/': (context) => const MyHomePage(title: '23W Mobile Web Applications - MDEV1005'),
        '/calculator': (context) => ToolCalculator(),
        '/notes': (context) => const ToolNotes(),
      },
    );
  }
}

// Define a StatefulWidget called MyHomePage
class MyHomePage extends StatefulWidget {

  // Constructor that requires a title and a key
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // Override createState method to return a new _MyHomePageState
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Define a State class called _MyHomePageState
class _MyHomePageState extends State<MyHomePage> {

  // Override the build method to create the UI for the widget
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold with an AppBar and a body containing a Column
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Display the widget's title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            Image.asset(
              'images/hello_welcome.png',
              width: 744,
              height: 360,
            ),
            Text(
              'Welcome to Our Flutter Web Application!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We, Isha Shekh and Manmohan Singh, worked together as a team of two on Assignment 4 of Mobile Web Application.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'We are pleased to share our completed work with you and look forward to your feedback.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Chooce one of the following tools:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToolCalculator(),
                      ),
                    );
                  },
                  child: const Text('Tool Calculator'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToolNotes(),
                      ),
                    );
                  },
                  child: const Text('Tool Notes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

