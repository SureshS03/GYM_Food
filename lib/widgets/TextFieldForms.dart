import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfieldforms extends StatelessWidget {
  final String title;
  final String hint;
  final bool isBlocked;
  const Textfieldforms(
      {super.key,
      required this.title,
      required this.hint,
      required this.isBlocked});

  @override
  Widget build(BuildContext context) {
    return isBlocked
        ? SizedBox(
            //width: double.infinity,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.forbidden,
                  child: Text(
                    'Blocked',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ))
        : SizedBox(
            //width: double.infinity,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Theme(
                data: ThemeData(
                    textSelectionTheme: TextSelectionThemeData(
                        selectionColor: Color(0xff635bff))),
                child: TextField(
                  cursorWidth: 0.8,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff635bff), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: hint,
                    hintStyle: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ));
  }
}
