class NewsModel {
  int id;
  String title;
  String description;
  String content;
  String imageUrl;
  String category;
  int readTime;
  String publishedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.readTime,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: (json['id'] ?? 0) as int,
      title: (json['title'] ?? 'no title') as String,
      description: (json['description'] ?? 'no description') as String,
      content: (json['content'] ?? 'no content') as String,
      imageUrl: (json['image_url'] ?? 'no image') as String,
      category: (json['category'] ?? 'no category') as String,
      readTime: (json['read_time'] ?? 5) as int,
      publishedAt: (json['created_at'] ?? 'no date') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'image_url': imageUrl,
      'category': category,
      'read_time': readTime,
      'created_at': publishedAt,
    };
  }
}
