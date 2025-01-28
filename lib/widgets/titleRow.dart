import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRow extends StatelessWidget {
  final String title;
  const TitleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.80,
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.home_filled),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 140, 203, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          title,
                          style: GoogleFonts.manrope(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
  }
}