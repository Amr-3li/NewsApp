import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:newsapp/Apis/models/news_model.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final newsRepository = NewsRepository(NewsWepService());
  List<News> news = [];
  NewsCubit(
    this.news,
  ) : super(NewsInitial());

  List<News> getNews() {
    newsRepository.getNews().then((value) {
      emit(NewsLoaded(value));
      news = value;
    });
    return news;
  }
}
