import '../models/movie.dart';
import 'network_client.dart';

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'YOUR_API_KEY'; //Replace with your TMDb API key
  static const String accessToken = 'YOUR_ACCESS_TOKEN'; //Replace with your TMDb access token

  late final NetworkClient _client;

  ApiService() {
    _client = NetworkClient(
      baseUrl: baseUrl,
      defaultHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    if (query.isEmpty) return [];

    final endpoint =
        '/search/multi?query=${Uri.encodeComponent(query)}&include_adult=false&language=en-US&page=$page&api_key=$apiKey';

    final data = await _client.get(endpoint);

    final results = (data['results'] as List?) ?? [];
    return results
        .where((item) => item['media_type'] == 'movie' || item['media_type'] == 'tv')
        .map((item) => Movie.fromJson(item))
        .toList();
  }
}
