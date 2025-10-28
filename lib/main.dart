// Import the Flutter Material package, which provides UI components like buttons, text, and layouts.
import 'package:flutter/material.dart';

// The main function is the entry point of every Flutter application.
void main() {
  runApp(MyApp()); // runApp() starts the app and loads the MyApp widget as the root widget.
}

// MyApp is a StatelessWidget, meaning it does not hold any state that can change over time.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the "debug" banner in the top-right corner.
      home: Scaffold( // Scaffold provides a basic layout structure with an app bar and body.
        appBar: AppBar(
          title: Text('Hello Flutter App'), // The title of the app shown in the AppBar.
        ),
        body: MyHomePage(), // The main content of the app, defined in MyHomePage.
      ),
    );
  }
}

// MyHomePage is another StatelessWidget that holds the main content of the screen.
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Center widget places its child at the center of the screen.
      child: Column( // Column arranges its children vertically.
        mainAxisAlignment: MainAxisAlignment.center, // Centers all child widgets vertically.
        children: <Widget>[ // A list of widgets inside the column.
          
          // Displays a text message in the app.
          Text(
            'Hello, Flutter!', // The text displayed on the screen.
            style: TextStyle(fontSize: 24), // Sets the text size to 24 pixels.
          ),
          
          SizedBox(height: 20), // Adds space between the text and button.
          
          // A button that performs an action when pressed.
          ElevatedButton(
            onPressed: () {
              print('Button Pressed!'); // Prints a message to the console when the button is clicked.
            },
            child: Text('Press Me Please'), // The label of the button.
          ),
          
          SizedBox(height: 20), // Adds space between the button and the image.
          
          // Displays an image from an online URL.
          Image.network(
            'https://tinyurl.com/bdfd544u', // URL of the image to be displayed.
            height: 400, // height in logical pixels
            width: 400,  // width in logical pixels
            fit: BoxFit.cover,
          ),
          

        ],
      ),
    );
  }
}