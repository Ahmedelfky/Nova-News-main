import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsService {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<List<NewsModel>> fetchNews({
    int page = 0,
    int limit = 10,
    String searchQuery = "",
  }) async {
    try {
      var query = supabaseClient.from("news").select();
      if (searchQuery.isNotEmpty) {
        query = query.ilike("title", "%$searchQuery%");
      }

      final response = await query
          .order("created_at", ascending: false)
          .range(page * limit, (page + 1) * limit - 1);
      return response.map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}
