
import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  ArticleModel({
   required this.author,
   required this.title,
   required this.description,
   required this.urlToImage,
   required this.publishedAt,
   required this.content,
  });

  String author;
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  String content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    author: json["author"]??" ",
    title: json["title"]??" ",
    description: json["description"]??" ",
    urlToImage: json["urlToImage"]??" ",
    publishedAt: json["publishedAt"]??" ",
    content: json["content"]??" ",
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "content": content,
  };
}
