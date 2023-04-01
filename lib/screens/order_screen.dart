import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sipariş'),
        ),
        body: const Center(
          child: Text('Made by Berkay İşkodra'),
        ),
      ),
    );
  }
}
