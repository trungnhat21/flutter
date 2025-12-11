// import 'package:flutter/material.dart';
// import 'package:flutter_duan/api.dart';
// import 'package:flutter_duan/model/product.dart';
// void main() {
//   runApp(const MyProduct());
// }

// class MyProduct extends StatefulWidget {
//   const MyProduct({super.key});

//   @override
//   State<MyProduct> createState() => _MyProductState();
// }

// class _MyProductState extends State<MyProduct> {
//   late Future<List<Product>> listProduct;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     var api = Api();
//     listProduct = api.getallproduct();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(future: listProduct, builder: (context, snap){
//         if (snap.connectionState == ConnectionState.done) {
//           return myListView(snap.data!);
//         } else {
//           return CircularProgressIndicator();
//         }
//       }),
//     );
//   }

//   Widget myListView(List<Product> list) {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       children: list.map((p)=> myItemProduct(p)).toList(),
//     );
//   }

//   Widget myItemProduct(Product product) {
//     return Text(product.title);
//   }
// }

// my_product.dart

import 'package:flutter/material.dart';
import 'package:flutter_duan/api.dart';
import 'package:flutter_duan/Baitap/model/product.dart';

class Bai10Product extends StatelessWidget {
  const Bai10Product({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyProduct(),
    );
  }
}

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late Future<List<Product>> listProduct;

  @override
  void initState() {
    super.initState();
    var api = Api();
    listProduct = api.getallproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANH SÁCH SẢN PHẨM'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        future: listProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text('Không tìm thấy sản phẩm nào.'));
            }
            return myListView(snapshot.data!);
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget myListView(List<Product> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return myItemProduct(list[index]);
      },
    );
  }

 Widget myItemProduct(Product product) {
    return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(
        color: Colors.grey, 
        width: 1.5,         
      ),
    ),
      margin: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.red[700],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating.rate} (${product.rating.count} đánh giá)',
                        style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Xem chi tiết: ${product.title}')),
                      );
                    },
                    child: const Text('Xem Chi Tiết'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}