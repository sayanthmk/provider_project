import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/widgets/assosiatelist.dart';

class AssosiateListPage extends StatelessWidget {
  const AssosiateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Assosiatedata>(context, listen: false).getAssosiates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: const Text(
          "Assosoiates",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: AssosiateList())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreenAccent,
          tooltip: "Add",
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/AddAssosiatePage');
          }),
    );
  }
}
