// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String? avatarUrl;
  final String? fullName;
  final DateTime? dob;
  final String? phoneNumber;
  final String? email;
  final int? gender;
  const AccountEntity({
    this.avatarUrl,
    this.fullName,
    this.dob,
    this.phoneNumber,
    this.email,
    this.gender,
  });

  @override
  List<Object?> get props => [
        avatarUrl,
        fullName,
        dob,
        phoneNumber,
        email,
        gender,
      ];

  AccountEntity copyWith({
    String? avatarUrl,
    String? fullName,
    DateTime? dob,
    String? phoneNumber,
    String? email,
    int? gender,
  }) {
    return AccountEntity(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      fullName: fullName ?? this.fullName,
      dob: dob ?? this.dob,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }
}
