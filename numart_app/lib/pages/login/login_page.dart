import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.0), // Add some space at the top
              Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0), // Add space below the "LOG IN" text
              Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 30.0), // Add some space before the text fields
              TextField(
                style: TextStyle(color: Colors.black), // Text color set to black
                decoration: InputDecoration(
                  hintText: 'Email *',
                  hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
                  filled: true,
                  fillColor: Colors.grey[200], // Light grey color for background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero, // Sharp edges
                    borderSide: BorderSide(
                      color: Colors.black, // Border color
                      width: 2.0, // Thicker border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero, // Sharp edges on focus
                    borderSide: BorderSide(
                      color: Colors.black, // Border color on focus
                      width: 2.0, // Thicker border width on focus
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: _obscureText,
                      style: TextStyle(color: Colors.black), // Text color set to black
                      decoration: InputDecoration(
                        hintText: 'Password *',
                        hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
                        filled: true,
                        fillColor: Colors.grey[200], // Light grey color for background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero, // Sharp edges
                          borderSide: BorderSide(
                            color: Colors.black, // Border color
                            width: 2.0, // Thicker border width
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero, // Sharp edges on focus
                          borderSide: BorderSide(
                            color: Colors.black, // Border color on focus
                            width: 2.0, // Thicker border width on focus
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Text(
                      _obscureText ? 'SHOW' : 'HIDE',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0), // Space before the button
              ElevatedButton(
                onPressed: () {
                  // Handle login action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 17.0), // Adjust button height
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0), // Space below the button
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking \'Log In\', you agree to our website ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Numart Privacy Notice',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0), // Add some space before the "JOIN US" section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JOIN US',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10.0), // Add some space
                  Text(
                    'It’s so easy to get in on the loyalty program. Tap these perks as soon as you join:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10.0), // Add some space
                  Text(
                    '✓ 15% off welcome offer\n✓ Free shipping, returns and exchanges on all orders\n✓ Early access to products',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 30.0), // Add space before the "Create Account" button
                  ElevatedButton(
                    onPressed: () {
                      // Handle create account action
                      Get.toNamed(Routes.signup);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(vertical: 17.0), // Adjust button height
                    ),
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}