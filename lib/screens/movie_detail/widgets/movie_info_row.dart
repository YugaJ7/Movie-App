import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieInfoRow extends StatelessWidget {
  final Movie movie;
  const MovieInfoRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _infoBadge('16+'),
            _infoBadge('1h 49m'),
            _infoBadge('HD'),
            _infoBadge(movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'),
            _infoBadge('CC'),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '${movie.releaseDate?.substring(0, 4) ?? 'N/A'} • '
          '${movie.mediaType == 'movie' ? 'Movie' : 'TV Series'}',
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _infoBadge(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[800],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
