import 'dart:convert';

import 'package:news_app/data%20layer/dataProdiver/newsApi.dart';
import 'package:news_app/data%20layer/model/arctileModel.dart';
import 'package:news_app/data%20layer/model/newsModel.dart';

class NewsRepo{
  NewsAPI newsAPI = NewsAPI();
  Future<List<ArticleModel>> getNews()async{
    var rawNews = await newsAPI.getWeather();
    NewsModel newsModel = NewsModel.fromJson(json.decode(rawNews));
    return newsModel.articles;
  }

}