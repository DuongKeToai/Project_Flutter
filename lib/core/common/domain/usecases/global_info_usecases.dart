
import 'package:flutter/material.dart';
import 'package:flutter_learning/core/common/domain/entities/genre.dart';
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';
import 'package:flutter_learning/core/common/domain/repositories/global_repository.dart';

import '../../../../features/home/domain/repositories/movie_repository.dart';

class GlobalInfoUsecases {
  final MovieRepository repository;
  final GlobalRepository globalRepository;
  GlobalInfoUsecases({
    required this.repository,
    required this.globalRepository,
  });

  Future<List<Genre>?> getGenre() {
    return repository.getGenre();
  }

  Future<ImageConfigInfo?> getImageInfo() {
    return repository.getImageInfo();
  }

  Future<Locale?> getLocale() {
    return globalRepository.getLocale();
  }

  Future<bool> setSavedLangCode(String langCode) {
    return globalRepository.setSavedLangCode(langCode);
  }
}
