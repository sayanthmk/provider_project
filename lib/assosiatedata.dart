import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider_database/model/assosiate.dart';
import 'package:provider_database/utils.dart';

class Assosiatedata extends ChangeNotifier {
  static const String _boxname = "assosiatebox";
  List<Assosiate> _assosiate = [];
  Assosiate? _activeAssosiate;

  void getAssosiates() async {
    var box = await Hive.openBox<Assosiate>(_boxname);
    _assosiate = box.values.toList();
    notifyListeners();
  }

  Assosiate getAssosiate(index) {
    return _assosiate[index];
  }

  void addassosiate(Assosiate assosiate) async {
    var box = await Hive.openBox<Assosiate>(_boxname);
    await box.add(assosiate);
    _assosiate = box.values.toList();
    notifyListeners();
  }

  void deleteAssosiate(key) async {
    var box = await Hive.openBox<Assosiate>(_boxname);
    await box.delete(key);
    _assosiate = box.values.toList();
    Log.i("deleted member$key");
    notifyListeners();
  }

  void editassosiate(Assosiate assosiate, int assosiateekey) async {
    var box = await Hive.openBox<Assosiate>(_boxname);
    await box.put(assosiateekey, assosiate);
    _assosiate = box.values.toList();
    _activeAssosiate = box.get(assosiateekey);
    Log.i("Edited${assosiate.name}");
    notifyListeners();
  }

  void setassosoiate(key) async {
    var box = await Hive.openBox<Assosiate>(_boxname);
    _activeAssosiate = box.get(key);
    notifyListeners();
  }

  getactiveassosiate() {
    return _activeAssosiate;
  }

  int get assoiatecount {
    return _assosiate.length;
  }
}
