import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_news.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNews getNews;

  NewsBloc({required this.getNews}) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
  }

  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await getNews(forceRefresh: event.forceRefresh);
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
