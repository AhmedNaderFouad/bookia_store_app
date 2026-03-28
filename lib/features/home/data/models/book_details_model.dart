class BookDetailsModel {
  DataModel? data;
  String? message;
  int? status;

  BookDetailsModel({this.data, this.message, this.status});

  BookDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class DataModel {
  int? id;
  String? name;
  String? author;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;
  int? rating;
  int? reviews;

  DataModel({
    this.id,
    this.name,
    this.author,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
    this.rating,
    this.reviews,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = (json['price_after_discount'] as num?)?.toDouble();
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
    rating = json['rating'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author'] = author;
    data['description'] = description;
    data['price'] = price;
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    data['stock'] = stock;
    data['best_seller'] = bestSeller;
    data['image'] = image;
    data['category'] = category;
    data['rating'] = rating;
    data['reviews'] = reviews;
    return data;
  }
}

