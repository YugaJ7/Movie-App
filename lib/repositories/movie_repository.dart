import '../services/api_service.dart';
import '../models/movie.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository({required this.apiService});

  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    return await apiService.searchMovies(query, page: page);
  }
}