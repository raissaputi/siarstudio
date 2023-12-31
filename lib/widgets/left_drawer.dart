import 'package:flutter/material.dart';
import 'package:siarstudio/screens/list_item.dart';
import 'package:siarstudio/screens/menu.dart';
import 'package:siarstudio/screens/studio_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(74, 20, 140, 1),
            ),
            child: Column(
              children: [
                Text(
                  'SiarStudio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(16)),
                Text("Keep track of your Studio here!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Tambah Item'),
            // Bagian redirection ke StudioFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudioFormPage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Daftar Item'),
            onTap: () {
              // Route menu ke halaman item
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}