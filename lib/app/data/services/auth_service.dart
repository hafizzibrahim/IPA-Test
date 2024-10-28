import "dart:convert";
import "package:http/http.dart" as http;
import "package:maritimmuda_connect/app/data/models/request/login_request.dart";
import "package:maritimmuda_connect/app/data/models/response/login_response.dart";
import "package:maritimmuda_connect/app/data/services/config.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthService {
  Future<bool> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: headersNoToken,
      body: jsonEncode(request),
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = loginResponseFromJson(response.body).token!;
      int userId = loginResponseFromJson(response.body).user!.id!;
      String? uid = loginResponseFromJson(response.body).user?.uid;
      String uuid = loginResponseFromJson(response.body).user!.uuid!;

      if (uid == null) {
        return false;
      }
      await prefs.setString("token", token);
      await prefs.setString("userId", userId.toString());
      await prefs.setString("uid", uid);
      await prefs.setString("uuid", uuid);

      return true;
    } else {
      return false;
    }
  }
}