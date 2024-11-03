

import 'package:flutter_learning/core/common/domain/entities/genre.dart';
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';

import '../../../core/common/domain/entities/movie.dart';
import '../domain/repositories/movie_repository.dart';
import '../data/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Genre>?> getGenre() {
    return remoteDataSource.getGenre();
  }

  @override
  Future<ImageConfigInfo?> getImageInfo() {
    return remoteDataSource.getImageConfigInfo();
  }

  @override
  Future<List<Movie>?> getMovies() {
    return remoteDataSource.getMovies();
  }

  @override
  Future<List<Movie>?> getUpcommingMovies() {
    return remoteDataSource.getUpcommingMovies();
  }
}
