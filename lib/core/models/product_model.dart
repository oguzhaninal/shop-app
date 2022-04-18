class ProductModel {
  int id, price;
  String name, image, description, timeStamp;
  bool isLiked = false;

  ProductModel({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.description,
    required this.timeStamp,
    required this.isLiked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      price: data['price'],
      name: data['name'],
      image: data['image'],
      description: data['description'],
      timeStamp: data['timeStamp'],
      isLiked: false,
    );
  }
}
