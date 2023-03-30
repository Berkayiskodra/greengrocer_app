

import 'package:flutter/material.dart';
import '/screens/test_screen.dart';
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
          title: Text('Manav'),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.png'))
                ),
              ),
    
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderScreen()),
                    );

                    },child: Text('Sipariş'),)
                  ],
                ),

              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsScreen()),
                    );

                    },child: Text('Ürünler'),)
                  ],
                ),

              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportsScreen()),
                    );

                    },child: Text('Raporlar'),)
                  ],
                ),

              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesScreen()),
                    );

                    },child: Text('Kategoriler'),)
                  ],
                ),

              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
                    );

                    },child: Text('Hakkımızda'),)
                  ],
                ),

              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestScreen()),
                    );

                    },child: Text('Test'),)
                  ],
                ),

              ),
            ]),
        ),
      ),
    );
  }
}