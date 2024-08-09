import 'package:newsapp/Apis/models/news_model.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';

class NewsRepository {
  final NewsWepService wepService;

  NewsRepository(this.wepService);
  Future<List<News>> getNews() async {
    List<News> news = [];
    List<dynamic> newsCome = await wepService.getNews();
    for (var n in newsCome) {
      News n1 = News(
        source: n["source"]["name"],
        title: n["title"],
        description: n["description"],
        url: n["url"],
        urlToImage: n["urlToImage"],
        publishedAt: n["publishedAt"],
      );

      news.add(n1);
    }

    return news;
  }

  Future<List<News>> getSearchNews(String s) async {
    List<News> news = [];
    List<dynamic> newsCome = await wepService.searchNews(s);
    for (var n in newsCome) {
      News n1 = News(
        source: n["source"]["name"],
        title: n["title"],
        description: n["description"],
        url: n["url"],
        urlToImage: n["urlToImage"],
        publishedAt: n["publishedAt"],
      );

      news.add(n1);
    }

    return news;
  }
}
