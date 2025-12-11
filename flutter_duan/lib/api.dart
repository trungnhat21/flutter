
// import 'package:dio/dio.dart';
// import 'package:flutter_duan/model/product.dart';

// class Api {
//   Future<List<Product>> getallproduct() async {
//     var url = 'https://fakestoreapi.com/products';
//     var dio = Dio();
//     var response = await dio.request(url);
//     List<Product> listProduct = [];
//     if (response.statusCode == 200) {
//       List list = response.data;
//       var listProduct = list.map((json) =>Product.fromJson(json)).toList();
//       print('lay data thanh cong');
//       print(listProduct[0].title);

//     } else {
//       print('Lỗi API');
//     }
//   }
// }


// api.dart

import 'package:dio/dio.dart';
import 'package:flutter_duan/Baitap/model/product.dart';

class Api {
  Future<List<Product>> getallproduct() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    try {
      var response = await dio.request(url);
      if (response.statusCode == 200) {
        List list = response.data;
        List<Product> listProduct = list.map((json) => Product.fromJson(json)).toList();
        print('Lấy dữ liệu thành công, số lượng: ${listProduct.length}');
        return listProduct;
      } else {
        print('Lỗi API: Status code ${response.statusCode}');
        return []; 
      }
    } catch (e) {
      print('Lỗi kết nối API: $e');
      return [];
    }
  }
}