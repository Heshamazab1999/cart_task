class CartProductModel {
  String? name;
  String? image;
  int? price;
  String? productId;
  int quantity = 1;

  CartProductModel({
    required this.quantity,
    this.name,
    this.price,
    this.image,
    this.productId,
    // this.totalprice,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    productId = map['productId'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['image'] = image;
    map['productId'] = productId;
    return map;
  }

  CartProductModel.fromFirebaseFireStore(Map<dynamic, dynamic> firestore)
      : name = firestore['name'],
        price = firestore['price'],
        productId = firestore['productId'],
        quantity = firestore['quantity'],
        image = firestore['image'];
}
