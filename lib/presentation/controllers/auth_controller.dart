import 'package:get/get.dart';
import 'package:user_starter/data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = AuthRepository();
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    isLoggedIn.value = authRepository.isUserLoggedIn();
  }

  Future<void> login(String email, String password) async {
    try {
      await authRepository.login(email, password);
      isLoggedIn.value = true;

        Get.snackbar(
      "Success",
      "Login successful!",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );

    await Future.delayed(Duration(seconds: 1));
    
      Get.offNamed('/userdetail');
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString().replaceAll("Exception: WARNING", "").trim(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

Future<void> register(String name, String email, String password) async {
  try {
    final message = await authRepository.register(name, email, password);
    
    Get.snackbar(
      "Success",
      message.isNotEmpty ? message : "Account created, please login",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );

    Get.offNamed('/login');  // Navigate to Login Screen
  } catch (e) {
    Get.snackbar(
      "Registration Failed",
      e.toString().replaceAll("Exception: WARNING", "").trim(),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}


  // Future<void> register(String name, String email, String password) async {
  //   try {
  //     await authRepository.register(name, email, password);
  //     isLoggedIn.value = true;
  //     Get.offNamed('/home');
  //   } catch (e) {
  //     Get.snackbar(
  //       "Registration Failed Controller Warn",
  //       e.toString().replaceAll("Exception: WARNING", "").trim(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 3),
  //     );
  //   }
  // }

  void logout() {
    authRepository.logout();
    isLoggedIn.value = false;
    Get.offNamed('/login');
  }
}

// import 'package:get/get.dart';
// import 'package:user_starter/data/repositories/auth_repository.dart';

// class AuthController extends GetxController {
//   final AuthRepository authRepository = AuthRepository();
//   var isLoggedIn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     checkLoginStatus();
//   }

//   void checkLoginStatus() {
//     isLoggedIn.value = authRepository.isUserLoggedIn();
//   }

//   Future<void> login(String email, String password) async {
//     try {
//       await authRepository.login(email, password);
//       isLoggedIn.value = true;
//       Get.offNamed('/home');
//     } catch (e) {
//       Get.snackbar("Login Failed", e.toString());
//     }
//   }

//   void logout() {
//     authRepository.logout();
//     isLoggedIn.value = false;
//     Get.offNamed('/login');
//   }
// }
