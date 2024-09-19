import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _selectedStyle = 'Both'; // Default selected value
  String _selectedMonth = '01'; // Default selected month
  String _selectedDay = '01'; // Default selected day
  bool _obscurePassword = true; // To toggle password visibility
  bool _checkboxValue1 = false; // For the first checkbox
  bool _checkboxValue2 = false; // For the second checkbox

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
                'JOIN US',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0), // Space below "JOIN US"

              // First Name TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'First Name *',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero, // Sharp edges
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0), // Add space between text fields

              // Last Name TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Last Name *',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email *',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),

              // Phone Number TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Mobile Phone Number',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0), // Space before "WHAT STYLES WOULD YOU LIKE TO SEE?"

              // "WHAT STYLES WOULD YOU LIKE TO SEE?" Text
              Text(
                'WHAT STYLES WOULD YOU LIKE TO SEE?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0), // Space below text

              // Radio Buttons in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero, // Remove default padding
                      title: Text('Men\'s', style: TextStyle(color: Colors.black, fontSize: 16)),
                      value: 'Men\'s',
                      groupValue: _selectedStyle,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedStyle = value!;
                        });
                      },
                      dense: true, // Reduce space between radio button and text
                      activeColor: Colors.black, // Color for selected state
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero, // Remove default padding
                      title: Text('Women\'s', style: TextStyle(color: Colors.black, fontSize: 16)),
                      value: 'Women\'s',
                      groupValue: _selectedStyle,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedStyle = value!;
                        });
                      },
                      dense: true, // Reduce space between radio button and text
                      activeColor: Colors.black, // Color for selected state
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero, // Remove default padding
                      title: Text('Both', style: TextStyle(color: Colors.black, fontSize: 16)),
                      value: 'Both',
                      groupValue: _selectedStyle,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedStyle = value!;
                        });
                      },
                      dense: true, // Reduce space between radio button and text
                      activeColor: Colors.black, // Color for selected state
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0), // Space below text

              // "SHARE YOUR BIRTHDAY" Text
              Text(
                'SHARE YOUR BIRTHDAY',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0), // Space below text

              // Month and Day Dropdowns in a Row
              Row(
                children: [
                  // Month Dropdown
                  Container(
                    width: 80.0, // Set the width for the month dropdown
                    child: DropdownButtonFormField<String>(
                      value: _selectedMonth,
                      items: List.generate(12, (index) {
                        final month = (index + 1).toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(month, style: TextStyle(color: Colors.blue)), // Set text color
                        );
                      }),
                      decoration: InputDecoration(
                        hintText: 'Month',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedMonth = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10.0), // Space between month and day dropdown

                  // Day Dropdown
                  Container(
                    width: 80.0, // Set the width for the day dropdown
                    child: DropdownButtonFormField<String>(
                      value: _selectedDay,
                      items: List.generate(31, (index) {
                        final day = (index + 1).toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day, style: TextStyle(color: Colors.blue)), // Set text color
                        );
                      }),
                      decoration: InputDecoration(
                        hintText: 'Day',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedDay = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0), // Space below text
              // "SET YOUR PASSWORD" Text
              Text(
                'SET YOUR PASSWORD',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0), // Space below text
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black), // Text color set to black
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Password *',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0), // Space between text field and "SHOW" text
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Text(
                      _obscurePassword ? 'SHOW' : 'HIDE',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0), // Space below text
              // "SET YOUR PASSWORD" Text
              Text(
                'Minimum 8 characters with at least one uppercase, one lowercase, one special character and a number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0), // Space below text
              // "SET YOUR PASSWORD" Text
              Text(
                'OPTIONAL',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0), // Space below text
              // Checkboxes
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Yes, sign me up for promotional emails from Numart, featuring exclusive offers, the latest product info, news about upcoming events, and more.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  value: _checkboxValue1,
                  activeColor: Colors.black,
                  onChanged: (newValue) {
                    setState(() {
                      _checkboxValue1 = newValue ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Checkbox at the start
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0), // Adjust padding
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CheckboxListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By checking this box, you agree to receive recurring automated promotional and personalized marketing text messages (e.g. cart reminders) from Numart at the cell number used when signing up. Consent is not a condition of any purchase. Reply HELP for help and STOP to cancel. Msg frequency varies. Msg & data rates may apply . View Terms & Privacy.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  value: _checkboxValue2,
                  activeColor: Colors.black,
                  onChanged: (newValue) {
                    setState(() {
                      _checkboxValue2 = newValue ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, // Checkbox at the start
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0), // Adjust padding
                ),
              ),
              SizedBox(height: 10.0), // Space below text
              Text(
                'By clicking \'Join Now\' I agree to the Numart Terms of Service and acknowledge that I have read the Privacy Policy.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
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
                    'JOIN NOW',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.0), // Space below text
              Text(
                'LOYALTY HAS ITS PERK',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0), // Add some space
              Text(
                'Get in on the loyalty program. Tap these perks as soon as you join:',
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
            ],
          ),
        ),
      ),
    );
  }
}
