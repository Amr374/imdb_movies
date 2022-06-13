import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movies/services.dart';
import 'package:imdb_movies/states.dart';

import '../model/search_model.dart';

class SearchCubit extends Cubit<MoviesStates> {
  SearchCubit() : super(MoviesInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchResult? searchResult ;
  // Welcome? test;
  MovieDetails? tes;
   getSearchData(String title) {
    emit(MoviesLoadingState());

    DioHelper.getData(
      url: 'Search/k_tkid7a7x/${title}',

    ).then((value) {
      print(value.data);
      // String se = value.data['MovieDetails'][0].id;
      searchResult = SearchResult.fromJson(value.data);
      print(searchResult!.results[0].id);

      emit(MoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MoviesErrorState(error.toString()));
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

