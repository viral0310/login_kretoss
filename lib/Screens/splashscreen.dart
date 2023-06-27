import 'package:flutter/material.dart';
import 'dart:async';

import '../Colors/Colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              child: SizedBox(
                child: Image.asset('images/imgpsh_fullsize_anim.png'),
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Accept ",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                Text(
                  "  Incoming",
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Multiple Source        ",
              style: TextStyle(fontSize: 35),
            ),
            const Text(
              "Recommendend features for the assignment   ",
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              "of the orders to truck and drive available          ",
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              "nearby                                                                     ",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).restorablePushReplacementNamed('/login');
        },
        backgroundColor: primary,
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
