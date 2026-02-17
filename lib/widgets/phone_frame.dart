import 'package:flutter/material.dart';

class PhoneFrame extends StatelessWidget {
  final Widget child;

  // iPhone logical size (points)
  final double width;
  final double height;

  const PhoneFrame({
    super.key,
    required this.child,
    this.width = 402,  // iPhone 17 / 17 Pro
    this.height = 874, // iPhone 17 / 17 Pro
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3BDBD),
      body: SafeArea(
        child: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(34),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  offset: const Offset(0, 18),
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
