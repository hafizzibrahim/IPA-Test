import 'dart:convert';

List<ResearchesResponse> researchesResponseFromJson(String str) =>
    List<ResearchesResponse>.from(
        json.decode(str).map((x) => ResearchesResponse.fromJson(x)));

String researchesResponseToJson(List<ResearchesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchesResponse {
  int? id;
  String? uuid;
  int? userId;
  String? name;
  String? role;
  String? institutionName;
  String? sponsorName;
  DateTime? startDate;
  DateTime? endDate;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;

  ResearchesResponse({
    this.id,
    this.uuid,
    this.userId,
    this.name,
    this.role,
    this.institutionName,
    this.sponsorName,
    this.startDate,
    this.endDate,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  factory ResearchesResponse.fromJson(Map<String, dynamic> json) =>
      ResearchesResponse(
        id: json["id"],
        uuid: json["uuid"],
        userId: json["user_id"],
        name: json["name"],
        role: json["role"],
        institutionName: json["institution_name"],
        sponsorName: json["sponsor_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        orderColumn: json["order_column"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "user_id": userId,
        "name": name,
        "role": role,
        "institution_name": institutionName,
        "sponsor_name": sponsorName,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "order_column": orderColumn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
