import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieOverview extends StatelessWidget {
  final Movie movie;
  const MovieOverview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        movie.overview ?? 'No synopsis available.',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
