import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/movie_repository.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<SearchMovies>(_onSearchMovies);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<MovieState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(MovieInitial());
      return;
    }

    emit(MovieLoading());

    try {
      final movies = await movieRepository.searchMovies(event.query);
      emit(MovieSuccess(movies, event.query));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<MovieState> emit) {
    emit(MovieInitial());
  }
}
