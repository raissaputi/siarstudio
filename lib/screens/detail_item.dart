import 'package:flutter/material.dart';
import 'package:siarstudio/models/item.dart';

class DetailItem extends StatelessWidget {
  final Item item;

  const DetailItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.fields.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.fields.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${item.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${item.fields.description}'),
            // Tambahkan informasi lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
