import 'package:demo/Home/Home_Screen.dart';
import 'package:flutter/material.dart';

// 1. Change to a StatefulWidget to manage state (text field input and validation)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 2. Add TextEditingControllers to read the input text
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define hardcoded credentials for demonstration
  static const String _correctUsername = 'lyfong';
  static const String _correctPassword = '1234';

  // Dispose of controllers when the widget is removed
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 3. Logic to handle the login attempt
  void _attemptLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Validation logic
    if (username == _correctUsername && password == _correctPassword) {
      // Success case
      _showSnackBar(context, 'Login Success!', Colors.green);

      // Navigate to the HomeScreen
      Navigator.of(context).pushReplacement(
        // Use pushReplacement so the user can't go back to login
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Failure case
      _showSnackBar(context, 'Wrong username or password.', Colors.red);
    }
  }

  // 4. Function to show the SnackBar message
  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGIN IN FORM',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),

              // Username Field
              TextField(
                controller: _usernameController, // Link controller
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Password Field
              TextField(
                controller: _passwordController, // Link controller
                // Set obscureText to TRUE for password security
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // Call the login attempt function on press
                  onPressed: _attemptLogin,
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
