

import 'package:flutter/material.dart';
import 'users_screen.dart';
import '/screens/about_us_screen.dart';
import '/screens/categories_screen.dart';
import '/screens/reports_screen.dart';
import '/screens/order_screen.dart';
import '/screens/products_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manav'),
        ),
        body: Center(
          child: Column(
            children: [
              //en üst kısım 
              Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.centerRight,
                //color: Colors.orange
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.png'))
                ),
              ),
    
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderScreen()),
                  );

                  },child: const Text('Sipariş'),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductsScreen()),
                  );

                  },child: const Text('Ürünler'),)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportsScreen()),
                  );

                  },child: const Text('Raporlar'),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                  );

                  },child: const Text('Kategoriler'),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUsScreen()),
                  );

                  },child: const Text('Hakkımızda'),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestScreen()),
                  );

                  },child: const Text('Kullanıcılar'),)
                ],
              ),
            ]),
        ),
      ),
    );
  }
}