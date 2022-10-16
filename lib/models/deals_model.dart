import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class DealsModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? color;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? price;
  @HiveField(4)
  late int quantity;
  @HiveField(5)
  String? time;
  @HiveField(6)
  String? discount;

  DealsModel(
      {this.color,
      this.id,
      this.name,
      this.price,
      this.quantity = 1,
      this.time,
      this.discount});

  DealsModel.fromJSON(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    color = json["color"];
    id = json["id"];
    name = json["name"];
    price = json["price"];
    time = json["time"];
    quantity = json["quantity"];
    discount = json["discount"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['quantity'] = quantity;
    data['discount'] = discount;
    data['time'] = time;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
