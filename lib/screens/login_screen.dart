import 'package:flutter/material.dart';
import 'package:app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NO WAIT'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email or username',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // TODO: Implement forgot password
              },
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D1B2),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Log in', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('OR')),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement Google login
              },
              icon: const Icon(Icons.g_mobiledata), // Placeholder for Google icon
              label: const Text('Continue with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA8E6CF),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement Facebook login
              },
              icon: const Icon(Icons.facebook),
              label: const Text('Continue with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA8E6CF),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}