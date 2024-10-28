const String baseUrl = "https://hub.maritimmuda.id/api";

final Map<String, String> headersNoToken = {
  'Content-Type': 'application/json',
};

Map<String, String> headersWithToken(String token) => {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
