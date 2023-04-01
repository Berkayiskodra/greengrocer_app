import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {

late Isar isar;

List<Product> productsList = [];

addProduct(String name, String type) async{

  final product = Product()
  ..name = name
  ..type = type;

  await isar.writeTxn(() async => await isar.products.put(product));

  getProducts();
}

deleteProduct(int id) async {
    await isar.writeTxn(()async {
      bool result = await isar.products.delete(id);
      if(result) {
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Ürün Kaldırıldı')));
        getProducts();
      }
      // ignore: curly_braces_in_flow_control_structures
      else(result) {
        ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Ürün Kaldırılamadı')));
      };     
      });
    }

productsToWidget(){
    return productsList
      .map((e) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(e.name!),
            const SizedBox(height: 5),
            Text(e.id.toString()),
            const SizedBox(height: 5),
            // ignore: prefer_interpolation_to_compose_strings
            Text('Tür: ' + e.type.toString()),
            ElevatedButton(onPressed: () => deleteProduct(e.id), child: const Icon(Icons.delete)),
          ],
        ),
      ))
      .toList();
  }

getProducts() async {
      final products = await isar.products.where().findAll();
      productsList = products;
      setState(() {});
    }

getProductsS() async {
      final products = await isar.products.filter().typeEqualTo('sebze').findAll();
      productsList = products;
      setState(() {});
  }

getProductsM() async {
      final products = await isar.products.filter().typeEqualTo('meyve').findAll();
      productsList = products;
      setState(() {});
  }

  openConnection() async{
    isar = await Isar.open([ProductSchema]);
    setState(() {});
  }

  closeConnection() async{
    await isar.close();
  }

  @override
  void initState() {
    // ignore: avoid_print
    print('Ekran Çalıştı');
    openConnection();
    super.initState();
  }

  @override
  // ignore: override_on_non_overriding_member
  void disponse() {
    // ignore: avoid_print
    print('Ekran Kapandı');
    closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Ürünler'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () => addProduct(
              'ıspanak' , 'sebze'),
              child: const Text('Ekle')),
             ElevatedButton(
              onPressed: getProducts, child: const Text('Ürünleri Listele')),
            ElevatedButton(
              onPressed: getProductsS, child: const Text('Sebzeleri Listele')),
            ElevatedButton(
              onPressed: getProductsM, child: const Text('Meyveleri Listele')),
            Expanded(
              child: ListView(
                children: productsToWidget(),
              ))
          ],
        )
        ),
    );
  }
}
