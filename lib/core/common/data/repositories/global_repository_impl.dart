// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter_learning/core/common/data/datasources/global_info_local_data_source.dart';
import 'package:flutter_learning/core/common/domain/repositories/global_repository.dart';
class GlobalRepositoryImpl implements GlobalRepository {
  final GlobalInfoLocalDatasource localDatasource;
  GlobalRepositoryImpl({
    required this.localDatasource,
  });
  @override
  Future<Locale?> getLocale() async {
    final langCode = await localDatasource.getLangCode();
    if (langCode != null) {
      return Locale(langCode);
    }
    return null;
  }

  @override
  Future<bool> setSavedLangCode(String langCode) {
    return localDatasource.setSavedLocale(langCode);
  }
}
