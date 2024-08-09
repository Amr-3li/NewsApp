// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:newsapp/Apis/models/news_model.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepository newsRepository;

  NewsCubit(
    this.newsRepository,
  ) : super(NewsInitial());

  Future<List<News>> getNews() async {
    emit(NewsLoading());
    try {
      List<News> news = [];
     await newsRepository.getNews().then((value) {
        news = value;
      });
      emit(NewsLoaded(news));
      return news;
    } on Exception catch (e) {
      emit(NewsError(e.toString()));
      return [];
    }
  }

  Future<List<News>> getSearchNews(String s) async {
    emit(SearchNewsLoading());
    try {
      List<News> news = [];
     await newsRepository.getSearchNews(s).then((value) {
        news = value;
      });
      emit(SearchNewsLoaded(news));
      return news;
    } on Exception catch (e) {
      emit(SearchNewsError(e.toString()));
      return [];
    }
  }
}
