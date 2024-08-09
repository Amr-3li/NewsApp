// ignore_for_file: must_be_immutable

part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
// get all news====================================================

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  List<News> newsList;
  NewsLoaded(this.newsList);
}

final class NewsError extends NewsState {
  String error;
  NewsError(this.error);
}
//get search news=====================================================
final class SearchNewsLoading extends NewsState {}

final class SearchNewsLoaded extends NewsState {
  List<News> newsList;
  SearchNewsLoaded(this.newsList);
} 

final class SearchNewsError extends NewsState {
  String error;
  SearchNewsError(this.error);
}