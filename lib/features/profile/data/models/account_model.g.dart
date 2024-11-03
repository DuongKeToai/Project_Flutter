// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      avatarUrl: json['avatar_url'] as String?,
      fullName: json['full_name'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'full_name': instance.fullName,
      'dob': instance.dob?.toIso8601String(),
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'gender': instance.gender,
    };
