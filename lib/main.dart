import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Add this import
import 'package:bemyeyes/views/camera_view.dart';
import 'package:bemyeyes/views/privacypolicy.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Adjust primary color as needed
        ),
        useMaterial3: true,
      ),
      home: StartPage(), // Use StartPage as the home widget
      debugShowCheckedModeBanner: false, // Set this to false to remove the debug banner
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063970), // Set background color to #063970
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30), // Add padding on the top
            child: Image.asset(
              'assets/eyeicon.png', // Path to the eye icon image
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20), // Add padding on the top
            child: Text(
              'Be My Eyes',
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 32, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Adjust font weight as needed
              ),
            ),
          ),
          Expanded(
            child: Container(), // Empty container to push content to the top
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By continuing you\n',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
                TextSpan(
                  text: 'agree to our ',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
                TextSpan(
                  text: 'privacy policy',
                  style: TextStyle(
                    decoration: TextDecoration.underline // Set text color to grey
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigate to the privacy policy page
                      // Replace PrivacyPolicyPage() with your actual privacy policy page widget
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                      );
                    },
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Adjust vertical spacing
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraView()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF064470)), // Set button background color to #062e70
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 60)), // Adjust button padding
            ),
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 18, // Adjust font size as needed
              ),
            ),
          ),
          SizedBox(height: 100), // Adjust vertical spacing
        ],
      ),
    );
  }
}


