import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/widgets/toast.dart';

class AssosiateEditPage extends StatefulWidget {
  final Assosiate currentAssosiate;
  const AssosiateEditPage({super.key, required this.currentAssosiate});

  @override
  State<AssosiateEditPage> createState() => _AssosiateEditPageState();
}

class _AssosiateEditPageState extends State<AssosiateEditPage> {
  String? newname;
  int? newphone;
  bool? newSenior;
  int? newage;
  DateTime? newJoinDate;
  void editassosiate(context) {
    if (newname == null) {
      toastWidget("Give entry name");
      return;
    }
    if (newname!.length < 2) {
      toastWidget("Get longer name");
      return;
    }
    Provider.of<Assosiatedata>(context, listen: false).editassosiate(
      Assosiate(
          name: newname!,
          phone: newphone!,
          isSenior: newSenior!,
          join: newJoinDate!,
          age: newage!),
      widget.currentAssosiate.key,
    );
    Navigator.pop(context);
  }

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  @override
  void initState() {
    _namecontroller.text = widget.currentAssosiate.name;
    newname = widget.currentAssosiate.name;

    _phonecontroller.text = widget.currentAssosiate.phone.toString();
    newphone = widget.currentAssosiate.phone;

    _agecontroller.text = widget.currentAssosiate.age.toString();
    newphone = widget.currentAssosiate.age;

    newSenior = widget.currentAssosiate.isSenior;

    newJoinDate = widget.currentAssosiate.join;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16.0,
        title: Text(
          "Edit${widget.currentAssosiate.name}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              editassosiate(context);
            },
            icon: const Icon(Icons.save),
            iconSize: 24,
            color: Colors.blue,
            tooltip: "save",
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
                controller: _namecontroller,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(() {
                    newname = v;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                controller: _phonecontroller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (v) {
                  setState(() {
                    newphone = int.parse(v);
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
                controller: _agecontroller,
                decoration: const InputDecoration(
                  hintText: "Age",
                ),
                onChanged: (v) {
                  setState(() {
                    newage = int.parse(v);
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
                    value: newSenior!,
                    onChanged: (v) {
                      setState(() {
                        newSenior = v;
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
                          newJoinDate = d;
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
