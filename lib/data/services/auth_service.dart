import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String loginUrl = 'http://cloudsand.my.id/user/login';
  final String registerUrl = 'http://cloudsand.my.id/user/register'; 

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        if (decodedData is Map<String, dynamic>) {
          return {"message": "Login success", ...decodedData};
          // return decodedData;
        } else {
          throw Exception('WARNING Unexpected response format');
        }
      } else {
        throw Exception('WARNING Login failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('WARNING Network error: $e');
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"first_name": name, "email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        if (decodedData is Map<String, dynamic>) {
          return {"message": "Account created, please login", ...decodedData};
          // return decodedData;
        } else {
          throw Exception('WARNING Unexpected response format');
        }
      } else {
        throw Exception('WARNING Registration failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('WARNING Network error: $e');
    }
  }
}


// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AuthService {
//   final String baseUrl = 'http://cloudsand.my.id/user/login';

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         "email": email,
//         "password": password
//       }),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('WARNING Login failed: ${response.body}');
//     }
//   }
// }
