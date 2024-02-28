import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
    final int id;
    final String title;
    final String description;
    final String thumbnail;
    final List<String> images;
    final int price;
    final double rating;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.price,
    required this.rating,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? thumbnail,
    List<String>? images,
    int? price,
    double? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'images': images,
      'price': price,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
      images: (map['images'] as List).map((e) => e.toString()).toList(),
      price: map['price'] as int,
      rating: double.parse('${map['rating']}'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, thumbnail: $thumbnail, images: $images, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.thumbnail == thumbnail &&
      listEquals(other.images, images) &&
      other.price == price &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      thumbnail.hashCode ^
      images.hashCode ^
      price.hashCode ^
      rating.hashCode;
  }
}
