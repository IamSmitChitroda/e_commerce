class DbProduct {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  String brand;
  String warrantyInformation;
  String availabilityStatus;
  String returnPolicy;
  String thumbnail;

  DbProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.brand,
    required this.warrantyInformation,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.thumbnail,
  });

  factory DbProduct.fromJson(Map<String, dynamic> json) => DbProduct(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        brand: json["brand"],
        warrantyInformation: json["warrantyInformation"],
        availabilityStatus: json["availabilityStatus"],
        returnPolicy: json["returnPolicy"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "brand": brand,
        "warrantyInformation": warrantyInformation,
        "availabilityStatus": availabilityStatus,
        "returnPolicy": returnPolicy,
        "thumbnail": thumbnail,
      };
}
