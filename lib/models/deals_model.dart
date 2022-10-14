class DealsModel {
  int? id;
  String? color;
  String? name;
  String? price;
  int? quantity;
  String? time;
  String? discount;

  DealsModel(
      {this.color,
      this.id,
      this.name,
      this.price,
      this.quantity,
      this.time,
      this.discount});

  DealsModel.fromJSON(Map<dynamic, dynamic> json) {
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
