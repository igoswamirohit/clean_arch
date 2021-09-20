import 'package:clean/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends User {
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

  const UserModel({
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

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json['id'] as int?,
        roleId: json['role_id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        profilePic: json['profile_pic'],
        countryId: json['country_id'],
        gender: json['gender'] as String?,
        phoneNo: json['phone_no'] as String?,
        dob: json['dob'],
        isActive: json['is_active'] as bool?,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        accessToken: json['access_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role_id': roleId,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'username': username,
        'profile_pic': profilePic,
        'country_id': countryId,
        'gender': gender,
        'phone_no': phoneNo,
        'dob': dob,
        'is_active': isActive,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'access_token': accessToken,
      };

  User toEntity() {
    return User(
      id: id,
      roleId: roleId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      username: username,
      profilePic: profilePic,
      countryId: countryId,
      gender: gender,
      phoneNo: phoneNo,
      dob: dob,
      isActive: isActive,
      created: created,
      modified: modified,
      accessToken: accessToken,
    );
  }

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
