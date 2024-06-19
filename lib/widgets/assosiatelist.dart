import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/widgets/assosiatetile.dart';

class AssosiateList extends StatelessWidget {
  const AssosiateList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Assosiatetile(
          titleIndex: index,
        );
      },
      itemCount: Provider.of<Assosiatedata>(context).assoiatecount,
      padding: const EdgeInsets.all(8.0),
    );
  }
}
