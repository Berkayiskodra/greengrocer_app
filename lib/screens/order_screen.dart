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
          title: Text('Sipariş'),
        ),
        body: Center(
          child: Text('Made by Berkay İşkodra'),
        ),
      ),
    );
  }
}
