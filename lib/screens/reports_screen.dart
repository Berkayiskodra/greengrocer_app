import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Raporlar'),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          // ignore: prefer_const_constructors
          child: Text('Made by Berkay İşkodra'),
        ),
      ),
    );
  }
}
