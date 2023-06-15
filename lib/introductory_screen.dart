import 'package:creature_keeper/features/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/globe.png',
            height: 150,
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'A globe shows details of its subject. A terrestrial globe shows landmasses and water bodies. It might show nations and major cities and the network of latitude and longitude lines. Some have raised relief to show mountains and other large landforms. A celestial globe shows notable stars, and may also show positions of other prominent astronomical objects.The word globe comes from the Latin word globus, meaning "sphere". Globes have a long history. The first known mention of a globe is from Strabo, describing the Globe of Crates from about 150 BC. The oldest surviving terrestrial globe is the Erdapfel, made by Martin Behaim in 1492.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              label: const Text('Proceed')),
        ],
      ),
    );
  }
}
