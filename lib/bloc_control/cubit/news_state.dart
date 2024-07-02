part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

// ignore: must_be_immutable
final class NewsLoaded extends NewsState {
  List<News> newsList;
  NewsLoaded(this.newsList);
}

final class NewsError extends NewsState {}
