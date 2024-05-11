import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF063970), // Set app bar background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set icon color
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
      ),
      backgroundColor: Color(0xFF064470), // Set background color
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information Collection and Use',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The "Be My Eyes" App is an object recognition application with voice output that utilizes the camera of your device to detect objects. When you use our App, we may collect and process the following types of information:',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Camera Access: The App requires access to your device\'s camera in order to detect objects and provide the intended functionality.',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '- Voice Output: The App may utilize voice output features to provide information about detected objects.',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '- Usage Data: We may collect information about how you use the App, such as the frequency and duration of your usage sessions, to improve our services and user experience.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Sharing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We do not share your personal information with third parties unless required by law or necessary to provide the services offered by the App. We may share anonymized and aggregated usage data for analytics and research purposes.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Security',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We take appropriate measures to safeguard your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Changes to this Privacy Policy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We reserve the right to update or change our Privacy Policy at any time. Any changes will be effective immediately upon posting the updated Privacy Policy on this page.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions or concerns about our Privacy Policy or the handling of your personal information, please contact us at jaberahmad@email.com',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Created by Jaber Mobarak and Ahmad Jaber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
