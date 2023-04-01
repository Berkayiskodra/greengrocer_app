import "package:isar/isar.dart";

part "product.g.dart";

@collection
class Product {
  Id id = Isar.autoIncrement;

  String? name;

  String? type;
}