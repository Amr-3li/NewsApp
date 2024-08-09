import 'package:flutter/material.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';

import '../../Apis/models/news_model.dart';
import '../widgets/news.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.text});
  final String text;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading =true;
  List<News> ?allNews;
@override
  void initState()  {
    super.initState();
    getNews();
  }
  Future<void> getNews() async {
    allNews = await NewsRepository(NewsWepService()).getSearchNews(widget.text);
    setState(() {
        isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.text)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 10),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : allNews != null && allNews!.isNotEmpty
                    ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: allNews!.length ,
                  itemBuilder: (context, index) {
                    if (allNews![index].title != "[Removed]") {
                      return NewsWidget(news: allNews![index]);
                    } else {
                      return const SizedBox(
                        width: 1,
                      );
                    }
                  },
                )
                    : const Text('No news available'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
