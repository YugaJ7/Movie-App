import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_bloc.dart';
import 'package:movie_app/blocs/movie_event.dart';
import 'package:movie_app/screens/home/widgets/search_bar_view.dart';
import 'package:movie_app/screens/home/widgets/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Movie Search',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBarView(
            controller: _searchController,
            onChanged: (query) {
              if (query.trim().isEmpty) {
                context.read<MovieBloc>().add(ClearSearch());
              } else {
                context.read<MovieBloc>().add(SearchMovies(query));
              }
            },
            onClear: () {
              _searchController.clear();
              context.read<MovieBloc>().add(ClearSearch());
            },
          ),
          Expanded(
            child: SearchResults(
              searchController: _searchController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
