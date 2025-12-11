import 'package:flutter/material.dart';

class Bai4Product extends StatelessWidget {
  const Bai4Product({super.key});

  @override
  Widget build(BuildContext context) {
    return myBody();
  }
}

Widget myBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      block1(),
      block2(),
      block3(), 
      
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), 
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0), 
              itemCount: 5,
              itemBuilder: (context, index) {
                return block4(index); 
              },
            ),
          ),
        ),
      ),
    ],
  );
}

Widget block1() {
  Color headerColor = Colors.blue.shade800; 

  return Container(
    height: 70, 
    width: double.infinity,
    color: headerColor, 
    alignment: Alignment.bottomCenter,

    child: Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0), 
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.arrow_back_ios, 
              color: Colors.black,
              size: 20.0,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Xung quanh vị trí hiện tại",
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16,
                    fontWeight: FontWeight.w600, 
                  ),
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ),

            const Text(
              "23 thg 10 – 24 thg 10",
              style: TextStyle(
                color: Colors.black, 
                fontSize: 14,
                fontWeight: FontWeight.w500, 
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget block2() {
  return Container(
    width: double.infinity,
    color: Colors.grey.shade50, 
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildToolbarItem(
          icon: Icons.sort, 
          text: "Sắp xếp",
          isActive: true, 
        ),

        _buildToolbarItem(
          icon: Icons.filter_list_outlined, 
          text: "Lọc",
          isActive: false,
        ),

        _buildToolbarItem(
          icon: Icons.map_outlined, 
          text: "Bản đồ",
          isActive: false,
        ),
      ],
    ),
  );
}

Widget _buildToolbarItem({
  required IconData icon,
  required String text,
  required bool isActive,
}) {
  final color = isActive ? Colors.red.shade700 : Colors.grey.shade700;
  
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        icon,
        size: 24,
        color: color,
      ),
      const SizedBox(height: 4), 
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}

Widget block3() {
  return const Padding(
    padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
    child: Text(
      "757 chỗ nghỉ",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
Widget block4(int index) {
    final List<String> placeNames = [
    "aNHill Boutique",  
    "An Nam Hue Boutique",
    "Huế jade Hill Villa",
  ];
  final placeName = placeNames[index % 3];
  final price = 109 + index * 10;
  
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Ảnh
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/120?random=${index + 1}"), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        "Bao bữa sáng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 12), 
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          placeName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite_border, size: 20, color: Colors.grey.shade600),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Stars
                  Row(
                    children: List.generate(5, (i) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "9,5",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Xuất sắc · 95 đánh giá",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                      const Text(
                        "Huế · Cách bạn 0,6km",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "1 suite riêng tư: 1 giường",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Đã bao gồm thuế và phí",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            
            // Giá
            Text(
              "US\$$price",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(height: 1, color: Colors.black12),
        ),
      ],
    ),
  );
}