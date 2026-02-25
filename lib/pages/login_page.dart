import 'package:flutter/material.dart';
import 'package:maintenance_provider_service/pages/home_page.dart';
import 'package:maintenance_provider_service/pages/register_page.dart';
import 'package:maintenance_provider_service/widgets/phone_frame.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color kTeal = Color(0xFF1F6F86);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        final h = c.maxHeight;

        final headerH = h * 0.28;
        final circleSize = w * 0.32;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: headerH,
                    decoration: const BoxDecoration(
                      color: kTeal,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          20,
                          circleSize / 2 + 28,
                          20,
                          20,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: kTeal,
                                fontFamily: "serif",
                              ),
                            ),
                            const SizedBox(height: 18),

                            _buildInput("+855", Icons.phone),

                            const SizedBox(height: 18),

                            // ✅ LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kTeal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const PhoneFrame(
                                        child: HomePage(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Start Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "serif",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // ✅ GO TO REGISTER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Go To ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const PhoneFrame(
                                          child: RegisterPage(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 231, 37, 37),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),
                            const Text(
                              "Or",
                              style: TextStyle(color: kTeal, fontSize: 16),
                            ),
                            const SizedBox(height: 10),

                            const Icon(
                              Icons.g_mobiledata,
                              size: 88,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: headerH - circleSize / 2,
                child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: kTeal, width: 3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                        color: Colors.black.withOpacity(0.2),
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.handyman,
                    size: circleSize * 0.5,
                    color: kTeal,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildInput(String hint, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: kTeal),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kTeal, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kTeal, width: 2),
        ),
      ),
    );
  }
}
