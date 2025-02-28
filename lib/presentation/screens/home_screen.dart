import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F2),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/bg11.jpg"),
              fit: BoxFit.cover,
              opacity: 0.85
              )
            ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("WELCOME",
                    style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF204815),
                    backgroundColor: Color(0xFF204815),
                    fixedSize: const Size(120, 40)
                  ),
                  child: 
                    Text("SIGN IN",
                    style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 364),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(177, 255, 255, 255),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                children: [
                  Text("User List",
                      style: GoogleFonts.poppins(
                      fontSize: 42,
                      color: Color(0xFF121212),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text("Find One who catch you",
                      style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}