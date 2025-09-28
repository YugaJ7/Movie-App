import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/blocs/movie_state.dart';
import 'package:movie_app/screens/home/widgets/search_empty_view.dart';
import 'package:movie_app/screens/home/widgets/search_error_view.dart';
import 'package:movie_app/screens/home/widgets/search_initial_view.dart';
import 'package:movie_app/screens/home/widgets/search_loading_view.dart';
import 'package:movie_app/screens/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/screens/home/widgets/movie_grid.dart';

class SearchResults extends StatelessWidget {
  final TextEditingController searchController;

  const SearchResults({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return const SearchInitialView();
        } else if (state is MovieLoading) {
          return const SearchLoadingView();
        } else if (state is MovieSuccess) {
          return state.movies.isEmpty
              ? const SearchEmptyView()
              : MovieGrid(
                  movies: state.movies,
                  onMovieTap: (movie) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                );
        } else if (state is MovieError) {
          return SearchErrorView(
            message: state.message,
            searchController: searchController,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
