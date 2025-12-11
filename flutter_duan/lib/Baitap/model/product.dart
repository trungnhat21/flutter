// class Product {
//     late int id;
//     late String title;
//     late dynamic price;
//     late String description;
//     late String category;
//     late String image;
//     //Rating rating;

//     Product({
//         required this.id,
//         required this.title,
//         required this.price,
//         required this.description,
//         required this.category,
//         required this.image,
//        // required this.rating,
//     });
//     factory Product.formJson(Map<String, dynamic> json) {
//       return Product(
//         id: json['id']??0,
//         title: json['title']??'',
//         price: json['price']??0.0,
//         description: json['description']??'',
//         category: json['category']??'',
//         image: json['image']??'',
//        // rating: json['rating'],
//       );
//     }
// }

// enum Category {
//     ELECTRONICS,
//     JEWELERY,
//     MEN_S_CLOTHING,
//     WOMEN_S_CLOTHING
// }

// class Rating {
//     double rate;
//     int count;

//     Rating({
//         required this.rate,
//         required this.count,
//     });
// }

// product.dart

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }
}