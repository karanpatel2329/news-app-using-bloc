import 'package:http/http.dart' as http;
class NewsAPI{
  Future getWeather()async{
    print("SJ");
    String Url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=YOURAPIKEY";
    var res = await http.get(Uri.parse(Url));
    if(res.statusCode==200){
      return res.body;
    }
  }
}