// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  late String? source;
  late String? title;
  late String? description;
  late String url;
  String? urlToImage;
  late String? publishedAt;
  News({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
  News.fromJson(Map<String, dynamic> json) {
    source = json['source']['name'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
