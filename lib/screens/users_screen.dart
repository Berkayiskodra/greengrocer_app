import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/user.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  
  late  Isar isar;

  //List<Widget> usersList = [];
  List<User> usersList = [];
  
  addUser(String name, String motherName, String fatherName, int age,
        String birthPlace, String phone) async {  

        final  user = User()
        ..name = name
        ..fatherName = fatherName
        ..motherName = motherName
        ..age = age
        ..birthPlace = birthPlace
        ..phone = phone;

      await isar.writeTxn(() async => await isar.users.put(user));
    
      getUsers();
      //ScaffoldMessenger.of(context)
      //.showSnackBar(SnackBar(content: Text('Kullanıcı Eklendi')));
      }

  
  editUser(int id , String name, String motherName, String fatherName, int age,
        String birthPlace, String phone) async {  

        final  user = User()
        ..id = id
        ..name = name
        ..fatherName = fatherName
        ..motherName = motherName
        ..age = age
        ..birthPlace = birthPlace
        ..phone = phone;

      await isar.writeTxn(() async => await isar.users.put(user));
    
      getUsers();
      //ScaffoldMessenger.of(context)
      //.showSnackBar(SnackBar(content: Text('Kullanıcı Eklendi')));
      }

  deleteUser(int id) async {
    await isar.writeTxn(()async {
      bool result = await isar.users.delete(id);
      if(result) {
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context)
        // ignore: prefer_const_constructors
        .showSnackBar(SnackBar(content: Text('Kullanıcı Kaldırıldı')));
        getUsers();
      }
      // ignore: curly_braces_in_flow_control_structures
      else(result) {
        ScaffoldMessenger.of(context)
        // ignore: prefer_const_constructors
        .showSnackBar(SnackBar(content: Text('Kullanıcı Kaldırılamadı')));
      };     
      });
    }
    
  usersToWidget(){
    return usersList
      .map((e) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(e.name!),
            // ignore: prefer_const_constructors
            SizedBox(height: 5),
            Text(e.id.toString()),
            // ignore: prefer_const_constructors
            SizedBox(height: 5),
            // ignore: prefer_interpolation_to_compose_strings
            Text('Yas: ' + e.age.toString()),
            // ignore: prefer_const_constructors
            ElevatedButton(onPressed: () => deleteUser(e.id), child: Icon(Icons.delete)),
          ],
        ),
      ))
      .toList();
  }

    getUsers() async {
      final users = await isar.users.where().findAll();
      usersList = users;
      setState(() {});
    }

    getYoungUsers() async {
      final users = await isar.users.filter().ageLessThan(20).findAll();
      usersList = users;
      setState(() {});
    }

    getOldUsers() async {
      final users = await isar.users.filter().ageGreaterThan(20).findAll();
      usersList = users;
      setState(() {});
    }

  openConnection() async{
    isar = await Isar.open([UserSchema]);
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
          title: Text('Kullanıcılar'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => addUser(
                'Berkay İskodra', 'X', 'Y', 25, 'İstanbul', '05377373434'),
              // ignore: prefer_const_constructors
              child: Text('Ekle')),
            ElevatedButton(
              onPressed: getUsers, child: const Text('Kullanıcıları Listele')),
            ElevatedButton(
              onPressed: getYoungUsers, child: const Text('20 Yaşından Küçükler')),
            ElevatedButton(
              onPressed: getOldUsers, child: const Text('20 Yaşından Büyükler')),
            ElevatedButton(
              onPressed: () {
                editUser(
                41,'Alperen Keskin', 'X', 'Y', 752, 'Ordu', '05377373434');
              },
              child: const Text("İd'si 41 Olan Kullanıcı Güncelle")),
            Expanded(
              child: ListView(
                children: usersToWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
