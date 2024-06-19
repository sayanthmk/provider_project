import 'package:hive/hive.dart';

part 'assosiate.g.dart';

@HiveType(typeId: 5)
class Assosiate extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int phone;

  @HiveField(2)
  final bool isSenior;

  @HiveField(3)
  final DateTime join;

  @HiveField(4)
  final int age;

  Assosiate(
      {required this.name,
      required this.phone,
      required this.isSenior,
      required this.join,
      required this.age});
}
