import 'package:flutter/material.dart';
import 'package:siarstudio/widgets/left_drawer.dart';
import 'package:siarstudio/widgets/studio_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<StudioItem> items = [
    StudioItem("Lihat Item", Icons.checklist, Colors.purple.shade900),
    StudioItem("Tambah Item", Icons.add_circle, Colors.blue.shade900),
    StudioItem("Logout", Icons.logout, Colors.pinkAccent.shade700),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SiarStudio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.purple.shade900,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Siar Catalog', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((StudioItem item) {
                  return StudioCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}