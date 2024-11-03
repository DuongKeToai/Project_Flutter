

import 'package:flutter_learning/core/common/domain/entities/genre.dart';
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';

import '../../../../core/common/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>?> getGenre();
  Future<ImageConfigInfo?> getImageInfo();
  Future<List<Movie>?> getMovies();
  Future<List<Movie>?> getUpcommingMovies();
}
