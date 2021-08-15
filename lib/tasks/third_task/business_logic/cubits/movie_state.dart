part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoadedSuccessfully extends MovieState {}

class MovieFailed extends MovieState {
  final String error;

  MovieFailed({
    required this.error,
  });
}

class MovieFavouriteChanged extends MovieState {}
