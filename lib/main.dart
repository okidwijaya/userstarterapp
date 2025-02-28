import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/web.dart';
import 'package:user_starter/presentation/screens/user/user_detail_screen.dart';
import './presentation/controllers/auth_controller.dart';
import './presentation/screens/auth/login_screen.dart';
import './presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AuthController());

  final logger = Logger();
  final box = GetStorage();
  box.listen(() {
    logger.i("📦 GetStorage Updated: ${box.read('isLoggedIn')}");
    logger.i("📦 GetStorage Updated: ${box.read('token')}");
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to user starter app',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AuthController().isLoggedIn.value ? const HomeScreen() : const LoginScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/userdetail', page: () => const UserDetailScreen()),
      ],
    );
  }
}
