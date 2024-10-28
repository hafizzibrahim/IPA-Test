const String baseUrl = "https://hub.maritimmuda.id/api";

final Map<String, String> headersNoToken = {
  'Content-Type': 'application/json',
};

Map<String, String> headerWithToken(String token) {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
