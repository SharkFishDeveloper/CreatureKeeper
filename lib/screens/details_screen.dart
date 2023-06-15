import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String email;
  const DetailsScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                labelText: 'Username',
                prefixIcon: const Icon(
                  Icons.person_outlined,
                  color: Colors.grey,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                labelText: 'Phone Number',
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Colors.grey,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                labelText: 'City',
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Colors.grey,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                // Add your logic for the proceed button here
              },
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
