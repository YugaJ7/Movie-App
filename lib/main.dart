import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/search_screen.dart';
import 'blocs/movie_bloc.dart';
import 'repositories/movie_repository.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: BlocProvider(
        create: (context) => MovieBloc(
          movieRepository: MovieRepository(
            apiService: ApiService(),
          ),
        ),
        child: SearchScreen(),
      ),
    );
  }
}