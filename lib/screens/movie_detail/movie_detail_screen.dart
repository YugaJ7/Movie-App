import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_action_buttons.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_info_row.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_overview.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_poster.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_title.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MoviePoster(movie: movie),
            MovieTitle(movie: movie),
            const SizedBox(height: 12),
            MovieInfoRow(movie: movie),
            const SizedBox(height: 20),
            MovieActionButtons(movie: movie),
            const SizedBox(height: 30),
            MovieOverview(movie: movie),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

