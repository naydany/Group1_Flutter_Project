import 'package:flutter/material.dart';
import 'package:maintenance_provider_service/pages/login_page.dart';
import 'package:maintenance_provider_service/pages/register_page.dart';
import 'package:maintenance_provider_service/widgets/phone_frame.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color kTeal = Color(0xFF156E88);
  static const Color kTealDark = Color(0xFF0F5C72);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final iconSize = (s.width * 0.52).clamp(150.0, 220.0);

    return Container(
      color: kTeal,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Mantenanace Provider Services",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.10),
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        offset: const Offset(0, 10),
                        color: Colors.black.withOpacity(0.22),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.handyman_rounded,
                        size: 92, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: (s.width * 0.75).clamp(240.0, 330.0),
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                        MaterialPageRoute(builder: (_) => const PhoneFrame(
                            child:LoginPage(),
                        ),
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kTealDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Text(
                      "LET'S GO LOGIN !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 6),

                GestureDetector(
                  onTap: () {
                    // Navigate to register page
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (_) => const PhoneFrame(
                            child:RegisterPage(),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFFE8F06A),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
