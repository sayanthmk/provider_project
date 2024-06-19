import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/pages/assosiateeditpage.dart';
import 'package:provider_database/utils.dart';

class Assosiateview extends StatelessWidget {
  const Assosiateview({super.key});

  @override
  Widget build(BuildContext context) {
    void deleteconfirmation(currentAssosiate) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Are You Sure",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("You Are About Delte ${currentAssosiate.name}"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("This Action Cannot Be Undone")
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Log.d("deleting ${currentAssosiate.name}");
                  Provider.of<Assosiatedata>(context, listen: false)
                      .deleteAssosiate(currentAssosiate.key);
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
                child: const Text(
                  "DELETE",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Log.d("cancelling");
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ))
            ],
          );
        },
      );
    }

    return Consumer<Assosiatedata>(
      builder: (context, assosiatedata, child) {
        Assosiate currentAssosiate = assosiatedata.getactiveassosiate();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            elevation: 16.0,
            title: Text(
              currentAssosiate.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Log.d("selected to edit");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AssosiateEditPage(
                        currentAssosiate: currentAssosiate);
                  }));
                },
                icon: const Icon(Icons.create),
                iconSize: 24.0,
                color: Colors.blue,
                tooltip: "Edit",
              ),
              IconButton(
                onPressed: () {
                  Log.d("selected for deletion");
                  deleteconfirmation(currentAssosiate);
                },
                icon: const Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.red,
                tooltip: "Delete",
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 36,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          currentAssosiate.phone.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          currentAssosiate.age.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Join Date",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat("yyyy-MM-dd")
                              .format(currentAssosiate.join),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Senior",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Switch(
                          value: currentAssosiate.isSenior,
                          onChanged: (bool v) {},
                          activeColor: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
