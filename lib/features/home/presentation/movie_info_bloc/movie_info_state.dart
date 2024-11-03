// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_info_bloc.dart';
//! Bước 4.2: Xác định State

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> upcommingMovies;
  MoviesLoaded(
    this.nowPlayingMovies,
    this.upcommingMovies,
  );
}

class MoviesLoading extends MoviesState {}

abstract class MoviesState {}
