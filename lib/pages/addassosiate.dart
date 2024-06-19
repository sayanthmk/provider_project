import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/widgets/toast.dart';

class AddAssosiatePage extends StatefulWidget {
  const AddAssosiatePage({super.key});

  @override
  State<AddAssosiatePage> createState() => _AddAssosiatePageState();
}

class _AddAssosiatePageState extends State<AddAssosiatePage> {
  String? name;
  int? phone;
  bool? senior;
  int? age;
  DateTime? joined;

  void addassosiate(context) {
    if (name == null) {
      toastWidget("Give entry name");
      return;
    }
    if (name!.length < 2) {
      toastWidget("Get longer name");
      return;
    }
    Provider.of<Assosiatedata>(context, listen: false).addassosiate(
      Assosiate(
          name: name!,
          phone: phone ?? 0,
          isSenior: senior ?? false,
          join: joined ?? DateTime.now(),
          age: age ?? 0),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: const Text(
          "Add assosiate",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              addassosiate(context);
            },
            icon: const Icon(Icons.save),
            iconSize: 24,
            color: Colors.blue,
            tooltip: "Save",
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(() {
                    name = v;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (v) {
                  setState(() {
                    phone = int.parse(v);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                decoration: const InputDecoration(
                  hintText: "Age",
                ),
                onChanged: (v) {
                  setState(() {
                    age = int.parse(v);
                  });
                },
              ),
              Row(
                children: [
                  const Text(
                    "Is senior",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    activeTrackColor: Colors.black,
                    activeColor: Colors.blue,
                    value: senior ?? false,
                    onChanged: (v) {
                      setState(() {
                        senior = v;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Join Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_view_day_rounded),
                    tooltip: "Tap to Open the Date picker",
                    onPressed: () async {
                      final DateTime? d = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime(2100),
                      );
                      if (d != null) {
                        setState(() {
                          joined = d;
                        });
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
