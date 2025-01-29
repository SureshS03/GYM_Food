import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelector extends StatefulWidget {
  //final String selectedGender;
  //final Function(String?) onChanged;

  const GenderSelector({
    super.key,
    /*required this.selectedGender, required this.onChanged*/
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = "Male";

  final List<String> genders = ["Male", "Female", "Disabled"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Gender",
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(genders.length, (index) {
              return MouseRegion(
                cursor: (index == 2)
                    ? SystemMouseCursors.forbidden
                    : SystemMouseCursors.click,
                child: Row(
                  children: [
                    Radio<String>(
                      activeColor: Color(0xff635bff),
                      hoverColor: Colors.transparent,
                      value: genders[index],
                      groupValue: selectedGender,
                      onChanged: (index == 2)
                          ? null
                          : (newValue) {
                              setState(() {
                                selectedGender = newValue!;
                              });
                            },
                    ),
                    Text(
                      genders[index],
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            })),
      ],
    );
  }
}