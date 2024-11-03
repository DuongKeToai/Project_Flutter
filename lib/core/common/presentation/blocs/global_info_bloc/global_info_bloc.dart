// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/core/common/domain/entities/genre.dart';
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';
import 'package:flutter_learning/core/common/domain/usecases/global_info_usecases.dart';
import 'package:flutter_learning/core/enums/status_state.dart';
import '../../../../services/logger_service.dart';

part 'global_info_event.dart';
part 'global_info_state.dart';

class GlobalInfoBloc extends Bloc<GlobalInfoEvent, GlobalInfoState> {
  final GlobalInfoUsecases usecase;
  GlobalInfoBloc(
    this.usecase,
  ) : super(const GlobalInfoState()) {
    on<GetGlobalInfo>((event, emit) async {
      try {
        emit(state.copyWith(status: StatusState.loading));
        final genreList = await usecase.getGenre();
        final imageConfig = await usecase.getImageInfo();
        final currentLocale = await usecase.getLocale();
        printS(
            "[GlobalInfoBloc] - [GetGlobalInfo] currentLocale: $currentLocale");
        emit(state.copyWith(
          genreList: genreList,
          imageConfigInfo: imageConfig,
          currentLocale: currentLocale,
        ));
      } catch (e) {
        printE("[GlobalInfoBloc] - [GetGlobalInfo] error: ${e.toString()}");
        emit(state.copyWith(
            status: StatusState.failure, errMsg: "error occured"));
      } finally {
        emit(state.copyWith(status: StatusState.idle));
      }
    });
    on<SetSavedLangCode>((event, emit) async {
      final isSuccess = await usecase.setSavedLangCode(event.langCode);
      if (isSuccess) {
        final currentLocale = await usecase.getLocale();
        emit(state.copyWith(currentLocale: currentLocale));
      }
    });
  }
}
