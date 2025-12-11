import 'package:flutter/material.dart';
// 💡 QUAN TRỌNG: Cần thêm package url_launcher vào pubspec.yaml
import 'package:url_launcher/url_launcher.dart'; 
import 'Baitap/model/post_model.dart'; 

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Không thể mở đường link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title, 
          style: const TextStyle(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hình ảnh Bài viết (Sử dụng post.imageUrl, khắc phục lỗi Null Safety)
            if (post.imageUrl != 'N/A')
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  post.imageUrl, 
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, size: 80, color: Colors.grey)),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),

            // 2. Tiêu đề chính
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            // 3. Ngày đăng (Sử dụng trường publishedAt đã bổ sung)
            Text(
              "Ngày đăng: ${post.publishedAt}", 
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            
            const Divider(height: 32, color: Colors.grey),

            // 4. Mô tả (Nội dung chi tiết)
            Text(
              post.description,
              style: const TextStyle(fontSize: 18, height: 1.5),
            ),
            const SizedBox(height: 30),

            // 5. Nút truy cập link gốc
            if (post.articleUrl != 'N/A')
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(post.articleUrl),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Đọc Bài viết Gốc', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}