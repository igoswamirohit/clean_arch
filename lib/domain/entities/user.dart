import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final int? roleId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final dynamic profilePic;
  final dynamic countryId;
  final String? gender;
  final String? phoneNo;
  final dynamic dob;
  final bool? isActive;
  final DateTime? created;
  final DateTime? modified;
  final String? accessToken;

  const User({
    this.id,
    this.roleId,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.profilePic,
    this.countryId,
    this.gender,
    this.phoneNo,
    this.dob,
    this.isActive,
    this.created,
    this.modified,
    this.accessToken,
  });

  @override
  List<Object?> get props {
    return [
      id,
      roleId,
      firstName,
      lastName,
      email,
      username,
      profilePic,
      countryId,
      gender,
      phoneNo,
      dob,
      isActive,
      created,
      modified,
      accessToken,
    ];
  }
}
