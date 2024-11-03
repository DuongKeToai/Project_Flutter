// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'global_info_bloc.dart';

class GetGlobalInfo extends GlobalInfoEvent {}

abstract class GlobalInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetSavedLangCode extends GlobalInfoEvent {
  final String langCode;
  SetSavedLangCode({
    required this.langCode,
  });

  @override
  List<Object?> get props => [langCode];
}
