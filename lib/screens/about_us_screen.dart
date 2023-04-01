import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hakkimizda'),
        ),
        body: const Center(
          child: Text('Made by Berkay İşkodra'),
        ),
      ),
    );
  }
}
