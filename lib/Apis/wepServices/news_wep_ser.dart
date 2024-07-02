import 'package:dio/dio.dart';
import 'package:newsapp/Strings/data.dart';

class NewsWepService {
  late Dio dio;
  NewsWepService() {
    dio = Dio();
    dio.options.baseUrl = baseURL;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<List<dynamic>> getNews() async {
    try {
      Response response =
          await dio.get("apiKey=$apiKey&q=world&sortBy=publishedAt&language=en");
      return response.data["articles"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> searchNews(String s) async {
    try {
      Response response =
          await dio.get("apiKey=$apiKey&q=$s&sortBy=publishedAt&language=en");
      print(response.toString());
      return response.data["articles"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
