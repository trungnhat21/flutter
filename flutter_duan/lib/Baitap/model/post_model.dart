class Post {
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String publishedAt; // 💡 ĐÃ BỔ SUNG: Trường thời gian đăng bài

  Post({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.articleUrl,
    required this.publishedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String? ?? 'Không có Tiêu đề', 
      description: json['description'] as String? ?? 'Không có Mô tả', 
      imageUrl: json['urlToImage'] as String? ?? 'N/A', // Ánh xạ từ 'urlToImage' API
      articleUrl: json['url'] as String? ?? 'N/A',
      publishedAt: json['publishedAt'] as String? ?? 'Thời gian không rõ', // Ánh xạ từ API
    );
  }
}