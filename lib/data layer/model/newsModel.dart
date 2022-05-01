
import 'dart:convert';

import 'arctileModel.dart';

NewsModel NewsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String NewsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
   required this.status,
   required this.totalResults,
   required this.articles,
  });

  String status;
  int totalResults;
  List<ArticleModel> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}
