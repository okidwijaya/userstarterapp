import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_starter/presentation/controllers/auth_controller.dart';
import './register_screen.dart';
import './forgot_password_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);
    
    await authController.login(
      _emailController.text.trim(),
      _passwordController.text,
    );
    
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          side: BorderSide(color: Color(0xFFEEEEEE)),
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF121212),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => const RegisterScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF121212),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Obx(() => Text(
              //   authController.isLoggedIn.value ? "User is Logged In" : "User is Logged Out",
              //   style: TextStyle(fontSize: 20),
              // )),
              _buildTextField('Email', _emailController, false),
              _buildTextField('Password', _passwordController, true),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF121212),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'LOGIN',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool obscureText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
        ),
      ],
    ),
  );
}

}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:user_starter/presentation/screens/user/user_detail_screen.dart';
// import 'package:flutter_svg/svg.dart';
// import './register_screen.dart';
// import './forgot_password_screens.dart';
// import 'package:http/http.dart' as http;

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         elevation: 0,
//         toolbarHeight: 100,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
//           side: BorderSide(
//             color: Color.fromARGB(255, 238, 238, 238),
//           ),
//         ),
//         flexibleSpace: Padding(
//           padding:
//               const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
//           child: (Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [BuElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterScreen(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF121212),
//                           padding:
//                               EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: Text(
//                           'Register',
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Email',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color(0xFF121212),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                 child: TextField(
//                   style: const TextStyle(
//                     color: Color(0xFF121212),
//                   ), // Text color when typing
//                   cursorColor: const Color(0xFF121212),
//                   decoration: InputDecoration(
//                     fillColor: const Color.fromARGB(255, 252, 252, 252),
//                     filled: true,
//                     hintText: 'Email',
//                     hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 197, 197, 197),
//                         fontSize: 14),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF000000)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 183, 183, 183)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Password',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color(0xFF121212),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                 child: TextField(
//                   style: const TextStyle(
//                     color: Color(0xFF121212),
//                   ), // Text color when typing
//                   cursorColor: const Color(0xFF121212),
//                   decoration: InputDecoration(
//                     fillColor: const Color.fromARGB(255, 252, 252, 252),
//                     filled: true,
//                     hintText: 'Password',
//                     hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 197, 197, 197),
//                         fontSize: 14),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF000000)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color.fromARGB(255, 183, 183, 183)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const ForgotPasswordScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Forget Password ?',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         color: Colors.black, // Warna teks
//                         fontSize: 14,
//                         fontWeight: FontWeight.w300,
//                         decoration: TextDecoration.underline, // Tambahkan garis bawah
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => UserDetailScreen(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF121212),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 10),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: Text(
//                           'LOGIN',
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'or',
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Color(0xFF121212),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Column(
//                       children: [
//                         SvgPicture.asset(
//                           'lib/images/google-icon.svg',
//                           semanticsLabel: 'Google',
//                           width: 42,
//                           height: 42,
//                           // color: Color(0xFF121212),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Google',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: Color(0xFF121212),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Column(
//                       children: [
//                         SvgPicture.asset(
//                           'lib/images/facebook-com.svg',
//                           semanticsLabel: 'Facebook',
//                           width: 44,
//                           height: 44,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Facebook',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: Color(0xFF121212),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Column(
//                       children: [
//                         SvgPicture.asset(
//                           'lib/images/x_twitter.svg',
//                           semanticsLabel: 'X.com',
//                           width: 44,
//                           height: 44,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'X.com',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: Color(0xFF121212),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }