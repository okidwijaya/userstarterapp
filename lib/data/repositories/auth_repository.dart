import 'package:get_storage/get_storage.dart';
import 'package:user_starter/data/models/user_model.dart';
import 'package:user_starter/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();
  final GetStorage storage = GetStorage();

  Future<UserModel> login(String email, String password) async {
    final data = await _authService.login(email, password);

    if (data == null || data['data'] == null) {
      throw Exception('WARNING Response structure is incorrect or null');
    }

    final token = data['data']['token']?.toString() ?? '';

    if (token.isEmpty) {
      throw Exception('WARNING Token is missing in response');
    }

    storage.write('token', token);
    storage.write('isLoggedIn', true);

    return UserModel.fromJson(data['data']);
  }

    Future<String> register(String name, String email, String password) async {
      final data = await _authService.register(name, email, password);

      if (data != null && data['message'] != null) {
        return data['message'];  
      } else {
        throw Exception('Registration failed');
      }
    }

  // Future<UserModel> register(String name, String email, String password) async {
  //   final data = await _authService.register(name, email, password);

  //   if (data != null && data['data'] != null && data['data']['token'] != null) {
  //     String token = data['data']['token'].toString();
  //     storage.write('token', token);
  //     storage.write('isLoggedIn', true);
  //   } else {
  //     throw Exception('WARNING Token missing in response');
  //   }

  //   return UserModel.fromJson(data['data']);
  // }

  void logout() {
    storage.remove('token');
    storage.write('isLoggedIn', false);
  }

  bool isUserLoggedIn() {
    final token = storage.read('token');
    return token is String && token.isNotEmpty;
  }
}

// import 'package:get_storage/get_storage.dart';
// import 'package:user_starter/data/models/user_model.dart';
// import 'package:user_starter/data/services/auth_service.dart';

// class AuthRepository {
//   final AuthService _authService = AuthService();
//   final GetStorage storage = GetStorage();

//   Future<UserModel> login(String email, String password) async {
//     final data = await _authService.login(email, password);

//     if (data.containsKey('token')) {
//       storage.write('token', data['token']);
//       storage.write('isLoggedIn', true);
//     } else {
//       throw Exception('WARNING Token missing in response');
//     }

//     return UserModel.fromJson(data);
//   }

//   void logout() {
//     storage.remove('token');
//     storage.write('isLoggedIn', false);
//   }

//   bool isUserLoggedIn() {
//     return storage.read('token') != null;
//   }
// }
