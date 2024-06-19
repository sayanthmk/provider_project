import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_database/assosiatedata.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/pages/addassosiate.dart';
import 'package:provider_database/pages/assosiatelistpage.dart';

void main() {
  Hive.registerAdapter(AssosiateAdapter());
  runApp(const MyApp());
}

Future _inithive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Assosiatedata(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => FutureBuilder(
                future: _inithive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      // print(snapshot.error);
                      return const Scaffold(
                        body: Center(
                          child:
                              Text("Error Establishing to connection to hive"),
                        ),
                      );
                    } else {
                      return const AssosiateListPage();
                    }
                  } else {
                    return const Scaffold();
                  }
                },
              ),
          "/AddAssosiatePage": (context) => const AddAssosiatePage(),
        },
      ),
    );
  }
}
