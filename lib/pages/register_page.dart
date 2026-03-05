import 'package:flutter/material.dart';
import 'package:maintenance_provider_service/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const Color kTeal = Color(0xFF1F6F86);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _handleRegister() {
    String name = _nameController.text.trim();
    String phone = _phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      // Show alert message
      String message = '';
      if (name.isEmpty && phone.isEmpty) {
        message = 'Please enter your name and phone number';
      } else if (name.isEmpty) {
        message = 'Please enter your name';
      } else {
        message = 'Please enter your phone number';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

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
                  // Teal header
                  Container(
                    height: headerH,
                    decoration: const BoxDecoration(
                      color: kTeal,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                  ),

                  // White body
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
                              "Register",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: kTeal,
                                fontFamily: "serif",
                              ),
                            ),
                            const SizedBox(height: 18),

                            _buildInput(
                              "Full Name",
                              Icons.person,
                              _nameController,
                            ),
                            const SizedBox(height: 14),
                            _buildInput("+855", Icons.phone, _phoneController),

                            const SizedBox(height: 18),

                            // ✅ REGISTER BUTTON → go to HomePage
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
                                onPressed: _handleRegister,
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "serif",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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

              // Circle icon overlap
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
                      ),
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

  // Input text field
  Widget _buildInput(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      keyboardType: hint == "+855" ? TextInputType.phone : TextInputType.text,
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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
