import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_starter/presentation/controllers/auth_controller.dart';
import 'package:user_starter/presentation/screens/auth/login_screen.dart';
import 'package:user_starter/presentation/screens/user/edit_profile_screen.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          side: BorderSide(
            color: Color.fromARGB(255, 238, 238, 238),
          ),
        ),
        flexibleSpace: Padding(
          padding:
              const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome @username',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121212),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.find<AuthController>().logout();
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen(),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF121212),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Logout',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  SvgPicture.asset(
                    'lib/images/account-circle.svg',
                    semanticsLabel: 'account',
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'mail@mail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF121212),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'First Name',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFF121212),
                  ), // Text color when typing
                  cursorColor: const Color(0xFF121212),
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    filled: true,
                    hintText: 'First Name',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 183, 183)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFF121212),
                  ), // Text color when typing
                  cursorColor: const Color(0xFF121212),
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    filled: true,
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 183, 183)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFF121212),
                  ), // Text color when typing
                  cursorColor: const Color(0xFF121212),
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    filled: true,
                    hintText: 'Address 1',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 183, 183)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFF121212),
                  ), // Text color when typing
                  cursorColor: const Color(0xFF121212),
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    filled: true,
                    hintText: 'Address 1',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                        fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 183, 183, 183)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF121212),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Edit',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
