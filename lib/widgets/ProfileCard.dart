import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Color(0xffffffff),
              
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user.jpg'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Claudia Foster',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Chemist',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Color(0xff6b7280),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            width: 380,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xffeff4fa),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon('assets/svg/facebook.svg'),
                _socialIcon('assets/svg/instagram.svg'),
                _socialIcon('assets/svg/github.svg'),
                _socialIcon('assets/svg/twitter.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SvgPicture.asset(assetPath, height: 14, width: 14),
    );
  }
}
