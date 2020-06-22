class Product {
  String description;
  int id;
  String imageUrl;
  String name;
  double price;
  int quantity;

  Product(
      {this.description,
      this.id,
      this.imageUrl,
      this.name,
      this.price,
      this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}