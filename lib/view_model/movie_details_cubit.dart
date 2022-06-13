import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movies/services.dart';
import 'package:imdb_movies/states.dart';

import '../model/movie_details_model.dart';
import '../model/search_model.dart';

class MovieDetailsCubit extends Cubit<MoviesStates> {
  MovieDetailsCubit() : super(GetMovieDetailsInitialState());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  MovieDetailsModel? movieDetails ;

  getMovieDetails(String id)async {
    emit(GetMovieDetailsLoadingState());

   await DioHelper.getData(
      url: 'API/Title/k_tkid7a7x/${id}/FullActor,Posters/',

    ).then((value) {
      // print(value.data);
      // String se = value.data['MovieDetails'][0].id;
      movieDetails = MovieDetailsModel.fromJson(value.data);
      print(movieDetails!.type);
      print(movieDetails!.actorList[0].name);
      // print(movieDetails!.posters!.postersList[0].id);

      print(movieDetails!.posters!.postersList[0].id);

      emit(GetMovieDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetMovieDetailsErrorState(error.toString()));
    });
  }
// void getTopMovies(String title) {
//   emit(MoviesLoadingState());
//
//   DioHelper.getData(
//     url: 'Search/k_tkid7a7x/${title}',
//     // data:
//     // {
//     //   'apiKey': 'k_tkid7a7x',
//     //   'expression': 'Inspection',
//     //
//     // },
//   ).then((value) {
//     print(value.data);
//     // Home = HomeModel.fromJson(value.data);
//     emit(MoviesSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(MoviesErrorState(error.toString()));
//   });
// }




}

