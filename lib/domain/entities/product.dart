class Product {
    Product({
        required this.id,
        required this.productCategoryId,
        required this.name,
        required this.producer,
        required this.description,
        required this.cost,
        required this.rating,
        required this.viewCount,
        required this.created,
        required this.modified,
        required this.productImages,
    });

    num id;
    num productCategoryId;
    String name;
    String producer;
    String description;
    num cost;
    num rating;
    num viewCount;
    String created;
    String modified;
    String productImages;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productCategoryId: json["product_category_id"],
        name: json["name"],
        producer: json["producer"],
        description: json["description"],
        cost: json["cost"],
        rating: json["rating"],
        viewCount: json["view_count"],
        created: json["created"],
        modified: json["modified"],
        productImages: json["product_images"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_category_id": productCategoryId,
        "name": name,
        "producer": producer,
        "description": description,
        "cost": cost,
        "rating": rating,
        "view_count": viewCount,
        "created": created,
        "modified": modified,
        "product_images": productImages,
    };
}
