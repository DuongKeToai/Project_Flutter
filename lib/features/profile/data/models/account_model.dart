// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_learning/features/profile/domain/entities/account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel extends AccountEntity {
  @JsonKey(name: 'avatar_url')
  @override
  final String? avatarUrl;
  @JsonKey(name: 'full_name')
  @override
  final String? fullName;
  @override
  final DateTime? dob;
  @JsonKey(name: 'phone_number')
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final int? gender;
  const AccountModel({
    this.avatarUrl,
    this.fullName,
    this.dob,
    this.phoneNumber,
    this.email,
    this.gender,
  }) : super(
          avatarUrl: avatarUrl,
          fullName: fullName,
          dob: dob,
          phoneNumber: phoneNumber,
          email: email,
          gender: gender,
        );
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  Map<String, dynamic> toJsonForNonNullItems() {
    Map<String, dynamic> result = {};
    if (avatarUrl != null) {
      result['avatar_url'] = fullName;
    }
    if (fullName != null) {
      result['full_name'] = fullName;
    }
    if (dob != null) {
      result['dob'] = dob!.toIso8601String();
    }
    if (phoneNumber != null) {
      result['phone_number'] = phoneNumber;
    }
    if (email != null) {
      result['email'] = email;
    }
    if (gender != null) {
      result['gender'] = gender;
    }
    return result;
  }
}
