import 'package:flutter/material.dart';
import 'package:imdb_movies/model/search_model.dart';
import 'package:imdb_movies/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movies/view/movie_details_screen.dart';
import 'package:imdb_movies/view_model/movie_details_cubit.dart';
import 'bloc_observer.dart';
import 'view/result_screen.dart';
import 'view/search_screen.dart';
import 'view_model/search_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
          () => runApp(const MyApp()),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => MovieDetailsCubit()..getMovieDetails('tt1375666'),),
        BlocProvider(
          create: (BuildContext context) => SearchCubit(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:  MovieDetailsScreen(),
      ),
    );
  }
}


