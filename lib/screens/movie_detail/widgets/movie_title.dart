import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieTitle extends StatelessWidget {
  final Movie movie;
  const MovieTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        movie.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
