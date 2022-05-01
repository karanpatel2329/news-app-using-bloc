import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data%20layer/model/arctileModel.dart';
class NewsScreen extends StatefulWidget {
  ArticleModel articleModel;
  NewsScreen({Key? key, required this.articleModel}) : super(key: key);
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("News Screen"),
        backgroundColor: Color(0xff242038),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration:BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.articleModel.urlToImage),fit: BoxFit.cover,)
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.1),
                      Colors.black38,
                    ],
                    stops: const [
                      0.0,
                      1.0
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.articleModel.author,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400,)),
                      Text(DateTime.parse(widget.articleModel.publishedAt).day.toString()+"/"+DateTime.parse(widget.articleModel.publishedAt).month.toString()+"/"+DateTime.parse(widget.articleModel.publishedAt).year.toString(),style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(widget.articleModel.title,style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.articleModel.content,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
