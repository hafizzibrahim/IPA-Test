// To parse this JSON data, do
//
//     final memberResponse = memberResponseFromJson(jsonString);

import 'dart:convert';

MemberResponse memberResponseFromJson(String str) =>
    MemberResponse.fromJson(json.decode(str));

String memberResponseToJson(MemberResponse data) => json.encode(data.toJson());

class MemberResponse {
  bool? success;
  List<Member>? members;

  MemberResponse({
    this.success,
    this.members,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) => MemberResponse(
        success: json["success"],
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class Member {
  int? id;
  String? uuid;
  String? uid;
  int? serialNumber;
  String? name;
  int? gender;
  String? email;
  DateTime? emailVerifiedAt;
  String? placeOfBirth;
  DateTime? dateOfBirth;
  String? locale;
  String? linkedinProfile;
  String? instagramProfile;
  int? provinceId;
  int? firstExpertiseId;
  int? secondExpertiseId;
  String? permanentAddress;
  String? residenceAddress;
  String? bio;
  int? isAdmin;

  Member({
    this.id,
    this.uuid,
    this.uid,
    this.serialNumber,
    this.name,
    this.gender,
    this.email,
    this.emailVerifiedAt,
    this.placeOfBirth,
    this.dateOfBirth,
    this.linkedinProfile,
    this.locale,
    this.instagramProfile,
    this.provinceId,
    this.firstExpertiseId,
    this.secondExpertiseId,
    this.permanentAddress,
    this.residenceAddress,
    this.bio,
    this.isAdmin,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        uuid: json["uuid"],
        uid: json["uid"],
        serialNumber: json["serial_number"],
        name: json["name"],
        gender: json["gender"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        locale: json["locale"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        linkedinProfile: json["linkedin_profile"],
        instagramProfile: json["instagram_profile"],
        provinceId: json["province_id"],
        firstExpertiseId: json["first_expertise_id"],
        secondExpertiseId: json["second_expertise_id"],
        permanentAddress: json["permanent_address"],
        residenceAddress: json["residence_address"],
        bio: json["bio"],
        isAdmin: json["is_admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "uid": uid,
        "serial_number": serialNumber,
        "name": name,
        "gender": gender,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "place_of_birth": placeOfBirth,
        "locale": locale,
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "linkedin_profile": linkedinProfile,
        "instagram_profile": instagramProfile,
        "province_id": provinceId,
        "first_expertise_id": firstExpertiseId,
        "second_expertise_id": secondExpertiseId,
        "permanent_address": permanentAddress,
        "residence_address": residenceAddress,
        "bio": bio,
        "is_admin": isAdmin,
      };
}
