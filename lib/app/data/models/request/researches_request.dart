import 'dart:convert';

String researchesRequestToJson(ResearchesRequest data) =>
    json.encode(data.toJson());

class ResearchesRequest {
  String name;
  String role;
  String institutionName;
  String sponsorName;
  String startDate;
  String endDate;

  ResearchesRequest({
    required this.name,
    required this.role,
    required this.institutionName,
    required this.sponsorName,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "institution_name": institutionName,
        "sponsor_name": sponsorName,
        "start_date": startDate,
        "end_date": endDate,
      };
}
