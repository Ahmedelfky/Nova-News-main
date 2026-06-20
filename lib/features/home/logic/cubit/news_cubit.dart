import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/home/data/Service/news_service.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService newsService;
  NewsCubit(this.newsService) : super(NewsInitial());

  int currentPage = 0;
  final int limit = 10;
  bool isFetchingMore = false;
  final List<NewsModel> allNews = [];

  Future<void> getNews({bool isRefresh = false}) async {
    if (isFetchingMore) return;
    isFetchingMore = true;

    if (isRefresh) {
      currentPage = 0;
    } else if (allNews.isEmpty) {
      emit(NewsLoading());
    }
    //await Future.delayed(const Duration(seconds: 5));
    try {
      final result = await newsService.fetchNews(
        page: currentPage,
        limit: limit,
      );
      final hasReachedMax = result.length < limit;
      if (isRefresh) {
        allNews.clear();
      }
      allNews.addAll(result);
      currentPage++;
      emit(NewsSuccess(List.from(allNews), hasReachedMax: hasReachedMax));
    } catch (massage) {
      if (allNews.isEmpty) {
        emit(NewsError(massage.toString()));
      }
    } finally {
      isFetchingMore = false;
    }
  }

  Future<void> searchNews(String query) async {
    emit(NewsLoading());

    try {
      final result = await newsService.fetchNews(searchQuery: query);
      emit(NewsSuccess(result, hasReachedMax: true));
    } catch (massage) {
      emit(NewsError(massage.toString()));
    }
  }
}
