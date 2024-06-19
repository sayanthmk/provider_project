import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/pages/assosiateview.dart';

class Assosiatetile extends StatelessWidget {
  final int titleIndex;
  const Assosiatetile({super.key, required this.titleIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<Assosiatedata>(
      builder: (context, assosiatedata, child) {
        Assosiate currentAssosiate = assosiatedata.getAssosiate(titleIndex);
        return Container(
          color: titleIndex % 2 == 0 ? Colors.grey : Colors.yellow,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreenAccent,
              child: Text(
                currentAssosiate.name.substring(0, 3),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            title: Text(
              currentAssosiate.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              currentAssosiate.phone.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Provider.of<Assosiatedata>(
                context,
                listen: false,
              ).setassosoiate(currentAssosiate.key);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Assosiateview();
              }));
            },
          ),
        );
      },
    );
  }
}
