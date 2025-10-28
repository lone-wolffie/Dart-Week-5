// first without animation

// // Import the Flutter Material package, which provides UI components like buttons, text, and layouts.
// import 'package:flutter/material.dart';

// // The main function is the entry point of every Flutter application.
// void main() {
//   runApp(MyApp()); // runApp() starts the app and loads the MyApp widget as the root widget.
// }

// // MyApp is a StatelessWidget, meaning it does not hold any state that can change over time.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Hides the "debug" banner in the top-right corner.
//       home: Scaffold( // Scaffold provides a basic layout structure with an app bar and body.
//         appBar: AppBar(
//           title: Text('Hello Flutter App'), // The title of the app shown in the AppBar.
//         ),
//         body: MyHomePage(), // The main content of the app, defined in MyHomePage.
//       ),
//     );
//   }
// }

// // MyHomePage is another StatelessWidget that holds the main content of the screen.
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center( // Center widget places its child at the center of the screen.
//       child: Column( // Column arranges its children vertically.
//         mainAxisAlignment: MainAxisAlignment.center, // Centers all child widgets vertically.
//         children: <Widget>[ // A list of widgets inside the column.
          
//           // Displays a text message in the app.
//           Text(
//             'Hello, Flutter!', // The text displayed on the screen.
//             style: TextStyle(fontSize: 24), // Sets the text size to 24 pixels.
//           ),
          
//           SizedBox(height: 20), // Adds space between the text and button.
          
//           // A button that performs an action when pressed.
//           ElevatedButton(
//             onPressed: () {
//               print('Button Pressed!'); // Prints a message to the console when the button is clicked.
//             },
//             child: Text('Press Me Please'), // The label of the button.
//           ),
          
//           SizedBox(height: 20), // Adds space between the button and the image.
          
//           // Displays an image from an online URL.
//           Image.network(
//             'https://tinyurl.com/bdfd544u', // URL of the image to be displayed.
//             height: 400, // height in logical pixels
//             width: 400,  // width in logical pixels
//             fit: BoxFit.cover,
//           ),
          

//         ],
//       ),
//     );
//   }
// }



// second with animation
// Import Flutter Material package (provides widgets, themes, and UI components)
import 'package:flutter/material.dart';

// Main entry point of every Flutter app
void main() {
  runApp(MyApp()); // runApp loads and starts the root widget (MyApp)
}

// MyApp is the root widget of the app (Stateless because it doesn’t hold changing data)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp provides material design visuals
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: Scaffold(
        // Scaffold gives the app a basic visual layout (AppBar + Body)
        appBar: AppBar(
          title: Text('Animated Flutter Widgets'), // Title shown in app bar
          centerTitle: true, // Centers the app bar title
          backgroundColor: Colors.indigo, // App bar background color
        ),
        body: MyHomePage(), // Body content (defined below)
      ),
    );
  }
}

// MyHomePage is Stateful because animation states will change over time
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState(); // Creates mutable state
}

// State class for MyHomePage, where animation logic lives
class _MyHomePageState extends State<MyHomePage> {
  bool _toggled = false; // Tracks whether animation is active or not

  @override
  Widget build(BuildContext context) {
    // Center aligns all widgets in the middle of the screen
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Vertically centers children
        children: [
          // ---------- Animated Text ----------
          AnimatedDefaultTextStyle(
            duration: Duration(seconds: 1), // Animation duration
            style: TextStyle(
              fontSize: _toggled ? 34 : 24, // Text grows in size when toggled
              color: _toggled ? Colors.indigo : Colors.black, // Color changes
              fontWeight: FontWeight.bold, // Bold text
            ),
            child: Text('Hello Flutter!'), // Animated text content
          ),

          SizedBox(height: 25), // Adds spacing between elements
          // ---------- Animated Container ----------
          AnimatedContainer(
            duration: Duration(seconds: 1), // Animation duration
            curve: Curves.easeInOut, // Smooth transition curve
            height: _toggled ? 130 : 90, // Height change
            width: _toggled ? 220 : 160, // Width change
            decoration: BoxDecoration(
              color: _toggled
                  ? Colors.indigo
                  : Colors.blueAccent, // Color animation
              borderRadius: BorderRadius.circular(20), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 6, // Blur strength
                  offset: Offset(3, 4), // Shadow offset
                ),
              ],
            ),
            alignment: Alignment.center, // Centers text inside
            child: Text(
              'Animated Box', // Container label
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 18, // Text size
              ),
            ),
          ),

          SizedBox(height: 25), // Adds space before button
          // ---------- Animated Button ----------
          AnimatedOpacity(
            duration: Duration(milliseconds: 800), // Smooth fade
            opacity: 1, // Always visible for clarity
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _toggled = !_toggled; // Toggle animation state
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Button background
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded edges
                ),
              ),
              child: Text(
                'Animate Everything', // Button label
                style: TextStyle(
                  color: Colors.white, // White font for visibility
                  fontSize: 16, // Readable text size
                  fontWeight: FontWeight.bold, // Bold button text
                ),
              ),
            ),
          ),

          SizedBox(height: 25), // Space before image
          // ---------- Animated Image (Network) ----------
          AnimatedOpacity(
            duration: Duration(seconds: 1), // Fade duration
            opacity: _toggled ? 0.4 : 1.0, // Fades when toggled
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Rounded image corners
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', // Online image URL
                height: 180, // Image height
                width: 180, // Image width
                fit: BoxFit.cover, // Crops image neatly
              ),
            ),
          ),
        ],
      ),
    );
  }
}