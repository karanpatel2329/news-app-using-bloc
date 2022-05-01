import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business%20logic%20layer/news_cubit.dart';
import 'package:news_app/data%20layer/dataProdiver/newsApi.dart';
import 'package:news_app/data%20layer/respository/newsRepo.dart';

import 'newsScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).FetchNews();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFF3F0),
        appBar: AppBar(
        title: Text("My News App"),
        backgroundColor: Color(0xff242038),
      ),
      body: Container(

        height: height,
        width: width,
        child:BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              return ListView.builder(
                  itemCount: state.articleList.length,
                  itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsScreen(articleModel: state.articleList[index],)));
                  },
                  child: Container(
                    margin:const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        state.articleList[index].urlToImage!=" "?Container(
                          margin: EdgeInsets.all(5),
                        height: 100,width: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          image: DecorationImage(
                            image: NetworkImage(state.articleList[index].urlToImage),fit: BoxFit.cover,)
                          )
                        ):SizedBox(width: 50,height: 50,),
                        Column(
                          children: [
                            SizedBox(width: width*0.68,child: Text(state.articleList[index].title,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(color: Color(0xff242038),fontSize: 20,fontWeight: FontWeight.w700),)),
                            SizedBox(width: width*0.68,child: Text(state.articleList[index].description,overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(color: Color(0xff242038),fontSize: 15,fontWeight: FontWeight.w400),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
              // return widget here based on BlocA's state
            }
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
