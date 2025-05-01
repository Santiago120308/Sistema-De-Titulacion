import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.school,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "DEP",
              style: GoogleFonts.lilitaOne(
                  fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
