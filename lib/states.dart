abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class MoviesLoadingState extends MoviesStates {}

class MoviesSuccessState extends MoviesStates {}
class MoviesErrorState extends MoviesStates
{
  final String error;

  MoviesErrorState(this.error);
}
class GetMovieDetailsInitialState extends MoviesStates {}

class GetMovieDetailsLoadingState extends MoviesStates {}

class GetMovieDetailsSuccessState extends MoviesStates {}
class GetMovieDetailsErrorState extends MoviesStates
{
  final String error;

  GetMovieDetailsErrorState(this.error);
}