import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_starter/presentation/controllers/auth_controller.dart';
import 'package:user_starter/presentation/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  bool isLoading = false;

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    
      await authController.register(
        firstNameController.text,
        emailController.text,
        passwordController.text,
      );

      setState(() => isLoading = false);
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
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF121212)),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen()); // Use GetX navigation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF121212),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Login', style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Obx(() => Text(
                //       authController.isLoggedIn.value ? "User is Logged In" : "User is Logged Out",
                //       style: TextStyle(fontSize: 20),
                //     )),
                buildTextField("First Name", firstNameController),
                buildTextField("Email", emailController, isEmail: true),
                buildTextField("Password", passwordController, isPassword: true),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF121212),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text('Register', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool isEmail = false, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF121212), fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Enter your $label',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$label cannot be empty";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:user_starter/presentation/screens/auth/login_screen.dart';
// import 'package:flutter_svg/svg.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

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
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Welcome',
//                       style: GoogleFonts.poppins(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF121212),
//                       ),
//                     ),
//                     Container(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
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
//                           'Login',
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
//               // const SizedBox(height: 20),
//               // const Text(
//               //   'Welcome',
//               //   textAlign: TextAlign.left,
//               //   style: TextStyle(
//               //       color: Color(0xFF121212),
//               //       fontSize: 26,
//               //       fontWeight: FontWeight.w600),
//               // ),
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'First Name',
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
//                     hintText: 'First Name',
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
//                               builder: (context) => LoginScreen(),
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
//                           'Register',
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